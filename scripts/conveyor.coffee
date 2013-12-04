################################################################################
window.conveyor = []
for x in [0..15]

  # Define Material Parameters
  mass        = 0
  friction    = 1
  restitution = 0.15
  tilesize    = 20

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(tilesize, 2, tilesize)
  textures = THREE.ImageUtils.loadTexture('assets/conveyor_belt.png')
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(map: textures), friction, restitution)
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
