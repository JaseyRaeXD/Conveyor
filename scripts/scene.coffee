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
selected = null
mouse3d  = new THREE.Vector3(0,0,0)
mousedown = false

getMouseCoordinates = (event) ->

  # Translate Mouse Coordinates from 2D to 3D
  screen = new THREE.Vector3(
     (event.clientX / window.innerWidth)  * 2 - 1,
    -(event.clientY / window.innerHeight) * 2 + 1, 0.5)
  projector = new THREE.Projector()
  projector.unprojectVector(screen, camera)

  # Find All Objects Colliding With the Raycaster
  raycaster = new THREE.Raycaster(camera.position, screen.sub(camera.position).normalize())
  intersect = raycaster.intersectObjects(items)

  # Determine the Scaled Mouse Coordinates
  direction = screen.sub(camera.position).normalize()
  distance  = - camera.position.z / direction.z
  position  = camera.position.clone().add(direction.multiplyScalar(distance))
  mouse3d   = new THREE.Vector3(position.x, position.y, 0)

  unless intersect.length is 0
    return intersect

onMove = (event) ->
  event.preventDefault()
  getMouseCoordinates(event)
  if selected
    selected.applyCentralImpulse(mouse3d.multiplyScalar(20))

onDown = (event) ->
  event.preventDefault()
  intersect = getMouseCoordinates(event)
  selected = intersect[0].object
  if selected
    console.log("I have picked an object!")

onUp = (event) ->
  event.preventDefault()
  selected = null
  mousedown = false

window.addEventListener "mousedown", (event) -> onDown(event)
window.addEventListener "mousemove", (event) -> onMove(event)
window.addEventListener "mouseup",   (event) -> onUp(event)
window.addEventListener "mouseout",  (event) -> onUp(event)

# Forward Locals to Globals
window.scene  = scene
window.camera = camera

