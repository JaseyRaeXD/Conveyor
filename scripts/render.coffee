# Disable Error Logging for Performance
if cfg.debug_mode is true
  silentErrorHandler = -> true
  window.onerror = silentErrorHandler

# Render Settings
parameters =
  alpha: true
  antialias: true
  clearColor: 0xFFFFFF
  maxLights: 16
  precision: "highp"

# Create the Renderer
renderer = new THREE.WebGLRenderer(parameters) # Render
document.body.appendChild(renderer.domElement) # Canvas
renderer.setSize(window.innerWidth, window.innerHeight)
#renderer.setClearColor(parameters.clearColor, 0.1)

# Define a Render Loop
render = () ->
  scene.simulate()                # Handle Physics
  scene.update()                  # Handle Events
  renderer.render(scene, camera)  # Render the Scene
  requestAnimationFrame(render)   # Call Next Frame

render() # Start Loop

# Adjust the Viewport on Window Resize
window.addEventListener "resize", ->
  renderer.setSize(window.innerWidth, window.innerHeight)
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()

# Record the Mouse Coordinates on Movement
#window.addEventListener "mousemove", (event) ->
#  console.log event.clientX
#  console.log event.clientY

#  camera.position.x -= 1
#  scene.position.x -= 1
  #camera.lookAt()
