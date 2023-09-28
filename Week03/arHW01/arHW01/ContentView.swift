//import SwiftUI
//import RealityKit
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
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        
//        // Set up AR configuration
//        let configuration = ARWorldTrackingConfiguration()
//        arView.session.run(configuration)
//        
//        // Create an anchor for the floating spheres
//        let anchor = AnchorEntity(world: [0, 0, -2])
//        
//        // Generate and add random spheres
//        for _ in 1...150 {
//            let sphereEntity = generateRandomSphere()
//            anchor.addChild(sphereEntity)
//            
//            // Animate the floating sphere
//            animateFloatingSphere(sphereEntity: sphereEntity)
//        }
//        
//        // Add the anchor to the ARView's scene
//        arView.scene.addAnchor(anchor)
//        
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {}
//    
//    // Function to generate random sphere entities
//    func generateRandomSphere() -> ModelEntity {
//        let sphere = MeshResource.generateSphere(radius: Float.random(in: 0.2...0.5))
//        let sphereEntity = ModelEntity(mesh: sphere, materials: [SimpleMaterial(color: .random, isMetallic: false)])
//        
//        let x = Float.random(in: -12.2...12.2)
//        let y = Float.random(in: -12.2...12.2)
//        let z = Float.random(in: -12.2...12.2)
//        
//        sphereEntity.position = [x, y, z]
//        
//        return sphereEntity
//    }
//    
//    // Function to animate a floating sphere
//    func animateFloatingSphere(sphereEntity: ModelEntity) {
//        let duration = Double.random(in: 2.0...5.0) // Random duration for each sphere's animation
//        let y = Float.random(in: 0.1...0.3) // Random height for floating
//        
//        // Move up
//        var transform = sphereEntity.transform
//        transform.translation.y += y
//        sphereEntity.move(to: transform, relativeTo: sphereEntity.parent, duration: duration)
//        
//        // Move down
//        transform.translation.y -= y
//        sphereEntity.move(to: transform, relativeTo: sphereEntity.parent, duration: duration)
//        
//        // Repeat the animation
//        sphereEntity.move(to: sphereEntity.transform, relativeTo: sphereEntity.parent, duration: 0)
//        sphereEntity.move(to: transform, relativeTo: sphereEntity.parent, duration: duration)
//    }
//}
//
//extension UIColor {
//    static var random: UIColor {
//        return UIColor(red: .random(in: 0...1),
//                       green: .random(in: 0...1),
//                       blue: .random(in: 0...1),
//                       alpha: 1.0)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
