import PlaygroundSupport
import SceneKit

// Set up the SceneView
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 800, height: 400))
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


let numCubes = 50

for _ in 1...numCubes {
    let cubeWidth = randomCGFloat(from: 0.1, to: 5.0)
    let cubeHeight = randomCGFloat(from: 0.1, to: 5.0)
    let cubeLength = randomCGFloat(from: 0.1, to: 5.0)
    
    let cubeGeometry = SCNBox(width: cubeWidth, height: cubeHeight, length: cubeLength, chamferRadius: 0.0)
    let cubeNode = SCNNode(geometry: cubeGeometry)
    
    let x = randomCGFloat(from: -10, to: 20)
    let y = randomCGFloat(from: -5, to: 20)
    let z = randomCGFloat(from: -10, to: 20)
    
    cubeNode.position = SCNVector3(x, y, z)
    
    let color = randomColor()
    cubeGeometry.firstMaterial?.diffuse.contents = color
    
    scene.rootNode.addChildNode(cubeNode)
}

// Animation: Make the cubes float around
for cubeNode in scene.rootNode.childNodes {
    let duration = Double.random(in: 2.0...5.0) // Random duration for each cube's animation
    let x = randomCGFloat(from: -10, to: 10)
    let y = randomCGFloat(from: -5, to: 5)
    let z = randomCGFloat(from: -10, to: 10)
    
    let moveAction = SCNAction.move(to: SCNVector3(x, y, z), duration: duration)
    let moveBackAction = SCNAction.move(to: cubeNode.position, duration: duration)
    let sequence = SCNAction.sequence([moveAction, moveBackAction])
    let repeatForever = SCNAction.repeatForever(sequence)
    
    cubeNode.runAction(repeatForever)
}
