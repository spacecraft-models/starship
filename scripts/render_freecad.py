# Render a FreeCAD document headlessly from three angles and export an STL of it.
# Run it through scripts/render_freecad.sh, which sets RENDER_MODEL and RENDER_OUT.
# The document is only opened and closed, never saved.
import os, struct, sys
import FreeCAD as App, FreeCADGui as Gui
Gui.setupWithoutGUI()
import Part
from pivy import coin
from PySide6.QtGui import QGuiApplication, QOffscreenSurface, QOpenGLContext, QSurfaceFormat
from PySide6.QtOpenGL import QOpenGLFramebufferObject, QOpenGLFramebufferObjectFormat

MODEL, OUT = os.environ["RENDER_MODEL"], os.environ["RENDER_OUT"]
NAME = os.path.splitext(os.path.basename(MODEL))[0]
W, H = 1000, 800
VIEWS = {"isometric": App.Vector(1, -1, 1),
         "front_right_low": App.Vector(2, -1, 0.6),
         "back_left_high": App.Vector(-1, 1.5, 2)}
os.makedirs(OUT, exist_ok=True)

def done(code, msg=None):
    if msg: print(msg)
    sys.stdout.flush()
    os._exit(code)

app = QGuiApplication.instance() or QGuiApplication(sys.argv or ["render"])
fmt = QSurfaceFormat()
fmt.setProfile(QSurfaceFormat.OpenGLContextProfile.CompatibilityProfile)
fmt.setVersion(2, 1)
ctx = QOpenGLContext(); ctx.setFormat(fmt)
if not ctx.create(): done(1, "ERROR could not create GL context")
surf = QOffscreenSurface(); surf.setFormat(fmt); surf.create()
if not ctx.makeCurrent(surf): done(1, "ERROR could not make GL context current")
ff = QOpenGLFramebufferObjectFormat()
ff.setAttachment(QOpenGLFramebufferObject.Attachment.CombinedDepthStencil)
ff.setSamples(8)
fbo = QOpenGLFramebufferObject(W, H, ff)

doc = App.openDocument(MODEL)
# Render the finished parts: visible solids that no other shape object is built from.
parts = [o for o in doc.Objects
         if hasattr(o, "Shape") and not o.Shape.isNull() and o.Shape.Volume > 0
         and getattr(o, "Visibility", True) and not any(hasattr(p, "Shape") for p in o.InList)]
if not parts: done(1, f"ERROR no visible solids in {MODEL}")
shape = Part.makeCompound([o.Shape for o in parts])
bb = shape.BoundBox
tol = max(bb.DiagonalLength / 2000, 0.01)                  # tessellation deflection, mm
verts, tris = shape.tessellate(tol)
print("VERSION", ".".join(App.Version()[:2]))
print("PARTS", ", ".join(f"{o.Label} ({o.TypeId})" for o in parts), "| TRIANGLES", len(tris))

with open(os.path.join(OUT, f"{NAME}.stl"), "wb") as f:   # binary STL, mm
    f.write(b"\0" * 80 + struct.pack("<I", len(tris)))
    for t in tris:
        a, b, c = (verts[i] for i in t)
        n = (b - a).cross(c - a)
        if n.Length > 0: n.normalize()
        f.write(struct.pack("<12fH", n.x, n.y, n.z, a.x, a.y, a.z, b.x, b.y, b.z, c.x, c.y, c.z, 0))

def mesh_node(color):
    sep = coin.SoSeparator()
    mat = coin.SoMaterial(); mat.diffuseColor = color; mat.ambientColor = color; sep.addChild(mat)
    hints = coin.SoShapeHints(); hints.vertexOrdering = coin.SoShapeHints.COUNTERCLOCKWISE
    hints.shapeType = coin.SoShapeHints.SOLID; sep.addChild(hints)
    nb = coin.SoNormalBinding(); nb.value = coin.SoNormalBinding.PER_FACE; sep.addChild(nb)
    c = coin.SoCoordinate3(); c.point.setValues(0, len(verts), [tuple(v) for v in verts]); sep.addChild(c)
    ifs = coin.SoIndexedFaceSet()
    idx = []
    for t in tris: idx += list(t) + [-1]
    ifs.coordIndex.setValues(0, len(idx), idx); sep.addChild(ifs)
    return sep

def edges_node():
    sep = coin.SoSeparator()
    lm = coin.SoLightModel(); lm.model = coin.SoLightModel.BASE_COLOR; sep.addChild(lm)
    mat = coin.SoMaterial(); mat.diffuseColor = (0.05, 0.05, 0.05); sep.addChild(mat)
    ds = coin.SoDrawStyle(); ds.lineWidth = 3; sep.addChild(ds)
    for e in shape.Edges:
        pts = [tuple(p) for p in e.discretize(Deflection=tol)]
        c = coin.SoCoordinate3(); c.point.setValues(0, len(pts), pts); sep.addChild(c)
        ls = coin.SoLineSet(); ls.numVertices.setValue(len(pts)); sep.addChild(ls)
    return sep

ctr = bb.Center
for name, d in VIEWS.items():
    d = App.Vector(d); d.normalize()
    v = App.Vector(-d.x, -d.y, -d.z)                      # camera -> target
    right = v.cross(App.Vector(0, 0, 1)); right.normalize()
    root = coin.SoSeparator()
    cam = coin.SoOrthographicCamera(); root.addChild(cam)
    # Light from above, a little toward the camera and to its left, plus coloured ambient:
    # the top always reads lightest and the two side faces get distinct, never-black tones.
    env = coin.SoEnvironment(); env.ambientIntensity = 0.35; root.addChild(env)
    hd = App.Vector(d.x, d.y, 0); hd.normalize()           # horizontal, toward camera
    to_light = App.Vector(0, 0, 1) * 0.6 + hd * 0.368 - right * 0.156
    kd = App.Vector(-to_light.x, -to_light.y, -to_light.z)
    key = coin.SoDirectionalLight(); key.intensity = kd.Length; kd.normalize()
    key.direction = tuple(kd); root.addChild(key)
    root.addChild(mesh_node((0.2, 0.5, 0.85))); root.addChild(edges_node())
    cam.position = tuple(ctr + d * (10 * bb.DiagonalLength))
    cam.pointAt(coin.SbVec3f(*ctr), coin.SbVec3f(0, 0, 1))
    vp = coin.SbViewportRegion(W, H)
    cam.viewAll(root, vp, 1.3)
    fbo.bind()
    f = ctx.functions()
    f.glViewport(0, 0, W, H); f.glEnable(0x0B71); f.glClearColor(1, 1, 1, 1)
    f.glClear(0x00004000 | 0x00000100)
    ra = coin.SoGLRenderAction(vp); ra.setCacheContext(1)
    ra.setTransparencyType(coin.SoGLRenderAction.SORTED_OBJECT_BLEND)
    ra.apply(root)
    img = fbo.toImage(); fbo.release()
    print("RENDER", name, img.save(os.path.join(OUT, f"{NAME}_{name}.png")))

App.closeDocument(doc.Name)
done(0)
