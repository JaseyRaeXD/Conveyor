################################################################################
window.items = []
for x in [0..2]

  # Define Material Parameters
  mass        = 10
  friction    = 1
  restitution = 0.5

  # Create the Object Mesh
  geometry = new THREE.CubeGeometry(5, 5, 5)
  textures = THREE.ImageUtils.loadTexture('assets/textures/PS9K1.png')
  material = Physijs.createMaterial(
         new THREE.MeshLambertMaterial(map: textures), friction, restitution)
  mesh = new Physijs.BoxMesh(geometry, material, mass)
  mesh.position.y = 15
  mesh.position.x += x * 50 - 30

  mesh.__dirtyPosition = true
  mesh.__dirtyRotation = true
  items.push(mesh)

(scene.add(mesh) for mesh in items)

################################################################################
for mesh in items
  mesh.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
    # blah

################################################################################


# `this` has collided with `other_object` with an impact speed of `relative_velocity` and a rotational force of `relative_rotation` and at normal `contact_normal`

#items[0].setCcdMotionThreshold(0);
#items[0].setCcdSweptSphereRadius(1);
#(box.__dirtyPosition = true for box in items)
#(box.__dirtyRotation = true for box in items)

# Locks the Z Axis
#(box.setAngularFactor(new THREE.Vector3(0, 0, 1)) for box in items)
#(box.setAngularVelocity(new THREE.Vector3(0, 0, 1)) for box in items)

