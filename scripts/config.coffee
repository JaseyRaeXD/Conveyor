# Forward the Namespace
window.cfg = cfg = {}

# General Configuration
debug_mode = true

# Scene Configuration
cfg.gravity = new THREE.Vector3(0, -50, 0)

# Camera Configuration
cfg.position = new THREE.Vector3(0, 10, 120)
cfg.aspect   = window.innerWidth / window.innerHeight
cfg.fov      = 35
cfg.near     = 1
cfg.far      = 1000
