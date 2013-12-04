################################################################################
window.conveyor = []
for x in [0..6]

  # Define Material Parameters
  mass        = 0
  friction    = 1
  restitution = 0.05
  tilesize    = 25

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(50, 2, tilesize)
  textures = THREE.ImageUtils.loadTexture('assets/textures/conveyor_belt.png')
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(map: textures), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)
  mesh.position.x = x * -50
  mesh.position.y = - 80
  mesh.position.z -= 5

  mesh.__dirtyPosition = true
  mesh.__dirtyRotation = true
  conveyor.push(mesh)

(scene.add(mesh) for mesh in conveyor)

################################################################################

for mesh in conveyor
  mesh.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
    # blah

################################################################################
