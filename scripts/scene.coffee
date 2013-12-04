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

window.items = items = {} # Forward Declare
mousevec = new THREE.Vector3(0,0,0)
selected = null # Raycast Object

getScreenCoordinates = (event) ->

  # Translate Mouse Coordinates from 2D to 3D
  screen = new THREE.Vector3(
     (event.clientX / window.innerWidth)  * 2 - 1,
    -(event.clientY / window.innerHeight) * 2 + 1, 0.5)
  projector = new THREE.Projector()
  projector.unprojectVector(screen, camera)
  return screen

getMouseCoordinates = (event) ->

  # Determine the 3D World Coordinates for Cursor
  screen    = getScreenCoordinates(event)
  direction = screen.sub(camera.position).normalize()
  distance  = - camera.position.z / direction.z
  position  = camera.position.clone().add(direction.multiplyScalar(distance))
  return new THREE.Vector3(position.x, position.y, 0)

getRaycastCoordinates = (event) ->

  # Find All Objects Colliding With the Raycaster
  screen    = getScreenCoordinates(event)
  direction = screen.sub(camera.position).normalize()
  raycaster = new THREE.Raycaster(camera.position, direction)
  return raycaster.intersectObjects(window.items)

onMove = (event) ->
  event.preventDefault()

  if selected

    mesh_vector = new THREE.Vector3(selected.position.x, selected.position.y, 0)
    mouse_vector = getMouseCoordinates(event)
    resultant = mesh_vector.sub(mouse_vector)
    resultant = resultant.multiplyScalar(-1)

    console.log(resultant.length())
    selected.applyCentralImpulse(resultant.multiplyScalar(0.75))

onDown = (event) ->
  event.preventDefault()
  intersect = getRaycastCoordinates(event)
  unless intersect.length is 0
    selected  = intersect[0].object
    console.log("I have selected an object!")

onUp = (event) ->
  event.preventDefault()
  selected = null

window.addEventListener "mousedown", (event) -> onDown(event)
window.addEventListener "mousemove", (event) -> onMove(event)
window.addEventListener "mouseup",   (event) -> onUp(event)
window.addEventListener "mouseout",  (event) -> onUp(event)

# Forward Locals to Globals
window.scene  = scene
window.camera = camera

