//
//  ContentView.swift
//  exportAR
//
//  Created by June Bee on 11/9/23.
//

//week06 "JuneLiDar" is the working export code and it is a refernce of file "ExportViewController.swift" in this app
//we are using "07-PhotoPickerBlender" example code to work around "UIViewConterollerRepresentable"
import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
//        ARViewContainer_ViewCtl().edgesIgnoringSafeArea(.all)
        ARViewContainer_View().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer_View: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Create a cube model
        let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
        let material = SimpleMaterial(color: .red, roughness: 0.15, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])
        
        // Create horizontal plane anchor for the content
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.children.append(model)
        
        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)
        
        func setARViewOptions() {
            arView.debugOptions.insert(.showSceneUnderstanding)
        }
        func buildConfigure() -> ARWorldTrackingConfiguration {
            let configuration = ARWorldTrackingConfiguration()
            
            configuration.environmentTexturing = .automatic
            configuration.sceneReconstruction = .mesh
            if type(of: configuration).supportsFrameSemantics(.sceneDepth) {
                configuration.frameSemantics = .sceneDepth
            }
            
            return configuration
        }
        func initARView() {
            setARViewOptions()
            let configuration = buildConfigure()
            arView.session.run(configuration)
        }
        
//        arView.session.delegate = self
//        super.viewDidLoad()
        
        initARView()

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ARViewContainer_ViewCtl: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        //    func makeUIView(context: Context) -> ARView {
        
        print("ARViewContainer makeUIViewController");
        
        let exportVC = ExportViewController()
        //        let size = sizeThatFits(.unspecified, uiViewController: exportVC, context: context)
        let arView = ARView(frame: CGRect(x: 0, y: 48, width: 414, height: 814))
        exportVC.arView = arView
        
        //        // Load the "Box" scene from the "Experience" Reality File
        //        let boxAnchor = try! Experience.loadBox()
        //
        //        // Add the box anchor to the scene
        //        arView.scene.anchors.append(boxAnchor)
        
        print("ARViewContainer makeUIViewController exportVC", exportVC);
        
        return exportVC
        
    }
    
    //    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //        print("ARViewContainer updateUIViewController context", context);
        print("ARViewContainer updateUIViewController uiViewController", uiViewController);
    }
}



//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
