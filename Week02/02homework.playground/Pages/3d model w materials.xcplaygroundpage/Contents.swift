import PlaygroundSupport
import SceneKit

// Create a SceneView to display the 3D content
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

// Create a scene
let scene = SCNScene()

// Create a camera and add it to the scene
let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: -2, z: 10)
scene.rootNode.addChildNode(cameraNode)

// Create a 3D model (replace 'yourModel.dae' with your model's file name)
if let modelScene = SCNScene(named: "cottage.dae") {
    for childNode in modelScene.rootNode.childNodes {
        // Ensure that the model's materials are applied correctly
        if let geometry = childNode.geometry {
            // Create a new material
            let imageMaterial = SCNMaterial()
            
            // Set the material's diffuse contents to an image
            if let image = UIImage(named: "house.png") {
                imageMaterial.diffuse.contents = image
                geometry.materials = [imageMaterial] // Assign the material to the geometry
            }
            
            
            // Add the node to the scene
            scene.rootNode.addChildNode(childNode)
        }
    }
}

// Set the scene to the scene view
sceneView.scene = scene
sceneView.allowsCameraControl = true

// Add the scene view to the Playground live view
PlaygroundPage.current.liveView = sceneView
