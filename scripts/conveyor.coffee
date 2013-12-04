################################################################################
window.conveyor = []
for x in [0..15]

  # Define Material Parameters
  mass        = 0
  friction    = 1
  restitution = 0.15
  tilesize    = 25

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(tilesize, 2, tilesize)
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)
  mesh.position.y = - 15
  mesh.position.x += x * tilesize - 10 * tilesize
  mesh.position.z -= 2

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
