# Load Configuration Variables
cfg = window.cfg

# Load the Physics Engine
Physijs.scripts.worker = "build/physijs/physijs_worker.js"
Physijs.scripts.ammo   = "examples/js/ammo.js"

# Define the Scene
scene = new Physijs.Scene
scene.setGravity(cfg.gravity)

# Create the Camera
camera = new THREE.PerspectiveCamera(
  cfg.fov,    # Field of View
  cfg.aspect, # Aspect Ratio
  cfg.near,   # Near Clipping Plane
  cfg.far)    # Far  Clipping Plane
camera.position = cfg.position
camera.lookAt(scene.position)
scene.add(camera)

# Update the Scene (Called Every Frame)
Physijs.Scene::update = () ->
  # box.position.y += 0.1
  # box.rotation.y += 0.1
  # box.__dirtyPosition = true
  # box.__dirtyRotation = true

scene.addEventListener "update", ->


# the scene's physics have finished updating

# Forward Locals to Globals
window.scene  = scene
window.camera = camera

