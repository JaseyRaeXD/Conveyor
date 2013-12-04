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


conveyor = []
for x in [0..10]

  # Define Material Parameters
  mass        = 0
  friction    = 0
  restitution = 1

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(15, 2, 15)
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)

  mesh.position.x += x * 16 - 50
  conveyor.push(mesh)

(scene.add(mesh) for mesh in conveyor)

for mesh in conveyor
  mesh.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
    # blah

# `this` has collided with `other_object` with an impact speed of `relative_velocity` and a rotational force of `relative_rotation` and at normal `contact_normal`

# Add a Sample Box
box = new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
box.position.y = 70
box.rotation.x = 1
box.rotation.z = 1
box.rotation.y = 1
box.setCcdMotionThreshold(0);
box.setCcdSweptSphereRadius(1);

scene.add box

box.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
  # box.translateX(50)
  box.setLinearVelocity(new THREE.Vector3(10, 0, 0))

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

