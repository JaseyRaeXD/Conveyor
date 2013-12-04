################################################################################
window.conveyor = []
for x in [0..10]

  # Define Material Parameters
  mass        = 0
  friction    = 1
  restitution = 0.15

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(15, 2, 15)
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)
  mesh.position.y = - 15
  mesh.position.x += x * 15 - 70

  mesh.__dirtyPosition = true
  mesh.__dirtyRotation = true
  conveyor.push(mesh)

(scene.add(mesh) for mesh in conveyor)

################################################################################

for mesh in conveyor
  mesh.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
    # blah

################################################################################


# `this` has collided with `other_object` with an impact speed of `relative_velocity` and a rotational force of `relative_rotation` and at normal `contact_normal`
