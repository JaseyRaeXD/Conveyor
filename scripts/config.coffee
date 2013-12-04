# Forward the Namespace
window.cfg = cfg = {}

# Scene Configuration
cfg.gravity = new THREE.Vector3(0, -9.81, 0)

# Camera Configuration
cfg.position = new THREE.Vector3(0, 30, 70)
cfg.aspect   = window.innerWidth / window.innerHeight
cfg.fov      = 40
cfg.near     = 1
cfg.far      = 1000
