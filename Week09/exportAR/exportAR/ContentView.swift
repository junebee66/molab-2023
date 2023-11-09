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

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    let exportView = ExportViewController()
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        exportView.arView = arView
        

//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
