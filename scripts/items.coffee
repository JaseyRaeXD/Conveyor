# Add a Sample Box
boxes = []
boxes.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
boxes.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
boxes.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)
boxes.push new Physijs.BoxMesh(new THREE.CubeGeometry(5, 5, 5), new THREE.MeshBasicMaterial({color: 0x888888, wireframe: true}), 10)

boxes[0].position.y = 70
boxes[1].position.y = 90
boxes[2].position.y = 120
boxes[3].position.y = 140

boxes[0].rotation.x = 1
boxes[0].rotation.z = 1
boxes[0].rotation.y = 1
boxes[0].setCcdMotionThreshold(0);
boxes[0].setCcdSweptSphereRadius(1);

(scene.add(box) for box in boxes)

box.addEventListener "collision", (other_object, relative_velocity, relative_rotation, contact_normal) ->
  # box.translateX(50)
  box.setLinearVelocity(new THREE.Vector3(10, 0, 0))
