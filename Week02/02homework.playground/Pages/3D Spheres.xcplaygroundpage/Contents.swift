import PlaygroundSupport
import SceneKit

// Set up the SceneView
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
let scene = SCNScene()
sceneView.scene = scene
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true

PlaygroundPage.current.liveView = sceneView

// Function to generate a random CGFloat between min and max
func randomCGFloat(from min: CGFloat, to max: CGFloat) -> CGFloat {
    return CGFloat.random(in: min..<max)
}

// Create random spheres
let numSpheres = 50

for _ in 1...numSpheres {
    let sphereRadius = randomCGFloat(from: 0.1, to: 1.0)
    
    let sphereGeometry = SCNSphere(radius: sphereRadius)
    let sphereNode = SCNNode(geometry: sphereGeometry)
    
    let x = randomCGFloat(from: -5, to: 5)
    let y = randomCGFloat(from: -5, to: 5)
    let z = randomCGFloat(from: -5, to: 5)
    
    sphereNode.position = SCNVector3(x, y, z)
    
    let color = UIColor(
        red: randomCGFloat(from: 0, to: 1),
        green: randomCGFloat(from: 0, to: 1),
        blue: randomCGFloat(from: 0, to: 1),
        alpha: 1.0
    )
    
    sphereGeometry.firstMaterial?.diffuse.contents = color
    
    scene.rootNode.addChildNode(sphereNode)
}
