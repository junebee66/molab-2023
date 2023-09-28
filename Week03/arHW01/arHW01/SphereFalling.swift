//import SwiftUI
//import SceneKit
//import ARKit
//
//struct ContentView: View {
//    var body: some View {
//        ARViewContainer()
//            .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    func makeUIView(context: Context) -> ARSCNView {
//        let arView = ARSCNView(frame: .zero)
//        
//        // Set up AR configuration
//        let configuration = ARWorldTrackingConfiguration()
//        arView.session.run(configuration)
//        
//        // Create an anchor for the floating spheres
//        let anchor = ARAnchor(name: "Anchor", transform: simd_float4x4(1.0))
//        arView.session.add(anchor: anchor)
//        
//        // Generate and add random spheres
//        for _ in 1...150 {
//            let sphereNode = generateRandomSphere()
//            arView.scene.rootNode.addChildNode(sphereNode)
//        }
//        
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARSCNView, context: Context) {}
//    
//    // Function to generate random sphere nodes
//    func generateRandomSphere() -> SCNNode {
//        let sphereGeometry = SCNSphere(radius: CGFloat.random(in: 0.2...5.5))
//        let sphereNode = SCNNode(geometry: sphereGeometry)
//        
//        let x = Float.random(in: -150.2...12.2)
//        let y = Float.random(in: -10.2...12.2)
//        let z = Float.random(in: -150.2...12.2)
//        
//        sphereNode.position = SCNVector3(x, y, z)
//        
//        // Add physics to the sphere
//        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
//        sphereNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
//        sphereNode.physicsBody?.mass = 1.0
//        
//        return sphereNode
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
