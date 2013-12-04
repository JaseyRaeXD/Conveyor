# Forward the Namespace
window.cfg = cfg = {}

# Scene Configuration
cfg.gravity = new THREE.Vector3(0, -9.81, 0)

# Camera Configuration
cfg.position = new THREE.Vector3(0, 10, 50)
cfg.aspect   = window.innerWidth / window.innerHeight
cfg.fov      = 70
cfg.near     = 1
cfg.far      = 1000
