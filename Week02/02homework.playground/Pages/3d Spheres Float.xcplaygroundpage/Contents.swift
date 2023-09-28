import PlaygroundSupport
import SceneKit

// Set up the SceneView
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
let scene = SCNScene()
sceneView.scene = scene
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true

PlaygroundPage.current.liveView = sceneView

// Function to generate a random CGFloat between min and max
func randomCGFloat(from min: CGFloat, to max: CGFloat) -> CGFloat {
    return CGFloat.random(in: min..<max)
}

// Function to generate a random UIColor
func randomColor() -> UIColor {
    return UIColor(
        red: randomCGFloat(from: 0, to: 1),
        green: randomCGFloat(from: 0, to: 1),
        blue: randomCGFloat(from: 0, to: 1),
        alpha: 1.0
    )
}

// Create random spheres
let numSpheres = 50

for _ in 1...numSpheres {
    let sphereRadius = randomCGFloat(from: 0.1, to: 1.0)
    
    let sphereGeometry = SCNSphere(radius: sphereRadius)
    let sphereNode = SCNNode(geometry: sphereGeometry)
    
    let x = randomCGFloat(from: -10, to: 10)
    let y = randomCGFloat(from: -5, to: 5)
    let z = randomCGFloat(from: -10, to: 10)
    
    sphereNode.position = SCNVector3(x, y, z)
    
    let color = randomColor()
    sphereGeometry.firstMaterial?.diffuse.contents = color
    
    scene.rootNode.addChildNode(sphereNode)
}

// Animation: Make the spheres float around
for sphereNode in scene.rootNode.childNodes {
    let duration = Double.random(in: 2.0...5.0) // Random duration for each sphere's animation
    let x = randomCGFloat(from: -10, to: 10)
    let y = randomCGFloat(from: -5, to: 5)
    let z = randomCGFloat(from: -10, to: 10)
    
    let moveAction = SCNAction.move(to: SCNVector3(x, y, z), duration: duration)
    let moveBackAction = SCNAction.move(to: sphereNode.position, duration: duration)
    let sequence = SCNAction.sequence([moveAction, moveBackAction])
    let repeatForever = SCNAction.repeatForever(sequence)
    
    sphereNode.runAction(repeatForever)
}

