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

struct ARViewContainer: UIViewControllerRepresentable {
    
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
