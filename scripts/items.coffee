# Add a Sample Box
window.items = []
items.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
items.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
items.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
items.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)

items[0].position.y = 70
items[1].position.y = 90
items[2].position.y = 120
items[3].position.y = 140

items[0].rotation.x = 1
items[0].rotation.z = 1
items[0].rotation.y = 1
items[0].setCcdMotionThreshold(0);
items[0].setCcdSweptSphereRadius(1);

(scene.add(box) for box in items)

box.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
  # box.translateX(50)
  #box.setLinearVelocity(new THREE.Vector3(10, 0, 0))
