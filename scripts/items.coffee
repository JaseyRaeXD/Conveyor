################################################################################
window.items = []

window.spawn_object = (height, width, depth, image, safe=0) ->
  # Define Material Parameters
  mass        = 5
  friction    = 1
  restitution = 0.15

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(height, width, depth)
  textures = THREE.ImageUtils.loadTexture('assets/textures/' + image)
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(map: textures), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)
  mesh.position.y = -20
  mesh.position.x = -120
  mesh.position.z = -2

  mesh.rotation.x = Math.random()
  mesh.rotation.y = Math.random()
  mesh.rotation.z = Math.random()

  mesh.safe = safe
  mesh.__dirtyPosition = true
  mesh.__dirtyRotation = true
  items.push(mesh)
  scene.add(mesh)


################################################################################

# Create Initial Spawn
# for x in [0..10]
#  spawn_object('PS9K1.png', 5, 5, 5)

################################################################################
for mesh in items
  mesh.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
    # blah

################################################################################
