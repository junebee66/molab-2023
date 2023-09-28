import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Set up AR configuration
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        // Load the butterfly 3D model
        let butterflyEntity = loadButterflyModel()
        
        // Create an anchor for the butterfly
        let anchor = AnchorEntity(world: [0, 0, 0])
        
        // Attach the butterfly model to a ModelEntity
        let butterflyModelEntity = ModelEntity()
        butterflyModelEntity.addChild(butterflyEntity)
        
        anchor.addChild(butterflyModelEntity)
        
        // Add the anchor to the ARView's scene
        arView.scene.addAnchor(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    // Function to load the butterfly 3D model
    func loadButterflyModel() -> Entity {
        guard let butterflyModelURL = Bundle.main.url(forResource: "butterfly", withExtension: "usdz"),
              let butterflyEntity = try? Entity.load(contentsOf: butterflyModelURL) else {
            fatalError("Unable to load butterfly 3D model")
        }
        
        // Scale and position the butterfly as needed
        butterflyEntity.scale = SIMD3<Float>(repeating: 0.01) // Adjust the scale
        butterflyEntity.position = [0, 0, -2] // Adjust the position
        
        // Add animations or physics properties if desired
        
        return butterflyEntity
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
