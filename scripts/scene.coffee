# Load Configuration Variables
cfg = window.cfg
window.framecount = 0
window.velocity = 5
window.interval = 300

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

# The Scene's Physics Have Finished Updating
# scene.addEventListener "update", ->
# Update the Scene (Called Every Frame)

Physijs.Scene::update = () ->

  # Fling Boxes Skyward if Height Limit Reached
  for box, index in items
    # Need to Implement Some Garbage Collection
    if      box.position.y >= 30
      scene.remove(box)
    # Apply Significant Upward Impulse
    else if box.position.y >= 17
      sky_vector = new THREE.Vector3(0, 25, 0)
      box.applyCentralImpulse(sky_vector)

  for belt in conveyor

    if belt.position.x >= 125
      belt.position.x  -= 250

    belt.setLinearVelocity(new THREE.Vector3(velocity,0,0))
    belt.position.x += 0.016 * velocity
    belt.__dirtyPosition = true

  # Some Clever Spawning Algorithm
  if framecount % interval is 0
    window.spawn_object('PS9K1.png', 5, 5, 5)
  framecount += 1

# Forward Locals to Globals
window.scene  = scene
window.camera = camera

