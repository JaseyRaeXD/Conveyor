# Load Configuration Variables
cfg = window.cfg
window.framecount = 0
window.velocity = 5
window.interval = 300
window.score = 0

# Load the Physics Engine
Physijs.scripts.worker = "build/physijs/physijs_worker.js"
Physijs.scripts.ammo   = "examples/js/ammo.js"

# Define the Scene
scene = new Physijs.Scene
scene.setGravity(cfg.gravity)

# Create the Camera
camera = new THREE.PerspectiveCamera(
  cfg.fov,    # Field of View
  cfg.aspect, # Aspect Ratio
  cfg.near,   # Near Clipping Plane
  cfg.far)    # Far  Clipping Plane
camera.position = cfg.position
camera.lookAt(scene.position)
scene.add(camera)

# The Scene's Physics Have Finished Updating
# scene.addEventListener "update", ->
# Update the Scene (Called Every Frame)

Physijs.Scene::update = () ->

  # Fling Boxes Skyward if Height Limit Reached
  for box, index in items
    # Need to Implement Some Garbage Collection
    if box.position.y >= 30
      scene.remove(box)
      if box.safe is 1
        score += 10
      else if box.safe is 0
        score -= 100

    # Apply Significant Upward Impulse
    else if box.position.y >= 17
      sky_vector = new THREE.Vector3(0, 25, 0)
      box.applyCentralImpulse(sky_vector)

    if box.position.x >= 120 and box.position.y < -120
      scene.remove(box)
      if box.safe is 0
        score += 1
      else if box.safe is 1
        score -= 100
    else if box.position.x < 120 and box.position.y < -120
      score -= 1
      if box.safe is 1
        score -= 5

  totalscore.innerHTML = score

  for belt in conveyor

    if belt.position.x >= 125
      belt.position.x  -= 250

    belt.setLinearVelocity(new THREE.Vector3(velocity,0,0))
    belt.position.x += 0.016 * velocity
    belt.__dirtyPosition = true

  # Some Clever Spawning Algorithm
  stage = 2
  if      framecount > 1000 then stage = 4
  else if framecount > 2000 then stage = 7
  else if framecount > 4000 then stage = 14
  else if framecount > 8000 then stage = 18

  if framecount % interval is 0
    switch Math.floor(Math.random() * stage)
      # Stage 0
      when 0  then window.spawn_object(5, 5, 5, 'playstation-regular.png')

      # Stage 1
      when 1  then window.spawn_object(5, 5, 5, 'swiss-cheese-moldy.png', 1)
      when 2  then window.spawn_object(5, 5, 5, 'commodore-crunch-regular.png')
      when 3  then window.spawn_object(5, 5, 5, 'commodore-crunch-misprint.png', 1)

      # Stage 2
      when 4  then window.spawn_object(5, 5, 5, 'land-o-cakes-regular.png')
      when 5  then window.spawn_object(5, 5, 5, 'pineapple-jacks-regular.png')
      when 6  then window.spawn_object(5, 5, 5, 'swiss-cheese-regular.png')

      # Stage 3
      when 7  then window.spawn_object(5, 5, 5, 'golden-do-rag-regular.png')
      when 8  then window.spawn_object(5, 5, 5, 'land-o-cakes-expired.png', 1)
      when 9  then window.spawn_object(5, 5, 5, 'swiss-cheese-solid.png', 1)
      when 10 then window.spawn_object(5, 5, 5, 'xbox-broken-logo.png', 1)
      when 11 then window.spawn_object(5, 5, 5, 'xbox-broken-rrod.png', 1)
      when 12 then window.spawn_object(5, 5, 5, 'xbox-regular.png')
      when 13 then window.spawn_object(5, 5, 5, 'golden-do-rag-blue.png', 1)
      when 14 then window.spawn_object(5, 5, 5, 'pineapple-jacks-jacks.png', 1)
      when 15 then window.spawn_object(5, 5, 5, 'playstation-9001.png', 1)
      when 16 then window.spawn_object(5, 5, 5, 'playstation-straight.png', 1)
      when 17 then window.spawn_object(5, 5, 5, 'smash-orange-soda-regular.png')
      when 18 then window.spawn_object(5, 5, 5, 'smash-orange-soda-crushed.png', 1)

  if framecount % interval is 0 then velocity += 0.05

  framecount += 1

# Forward Locals to Globals
window.scene  = scene
window.camera = camera

