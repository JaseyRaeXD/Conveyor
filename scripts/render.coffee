# Disable Error Logging for Performance
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

# Define a Render Loop
window.render = () ->
  scene.simulate()                # Handle Physics
  scene.update()                  # Handle Events
  renderer.render(scene, camera)  # Render the Scene
  requestAnimationFrame(render)   # Call Next Frame

#render() # Start Loop

# Adjust the Viewport on Window Resize
window.addEventListener "resize", ->
  renderer.setSize(window.innerWidth, window.innerHeight)
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()
