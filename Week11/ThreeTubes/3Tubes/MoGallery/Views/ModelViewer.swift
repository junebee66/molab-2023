//
//  ContentView.swift
//  3dview
//
//  Created by June Bee on 11/30/23.
//

import SwiftUI
import SceneKit

//struct ContentView: View {
//    var body: some View {
//        SceneKitView()
//            .edgesIgnoringSafeArea(.all)
//    }
//}

struct ModelView: View {
        
    @EnvironmentObject var app: AppModel
    
    var body: some View {
        ModelViewBridge(appURL: app.modelURL)
    }
}

struct ModelViewBridge: UIViewRepresentable {
//    var app: AppModel;
    var appURL: URL?
//    var matFile:
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        
//        var scene: SCNScene?
        // Load .obj file
        var scene = SCNScene(named: "air_jordan_1_retro_high_tie_dye.usdz")
        
        print("obj created", appURL ?? "no value")
        
//            if appURL != nil{
//                do {
//                    scene = try SCNScene(url: appURL!, options: nil);
//                    print("obj updated")
//                } catch {print("error", error)}
//            }
        
//        if app.modelURL != nil{
//            do {
//                scene = try SCNScene(url: app.modelURL!, options: nil);
//                print("obj updated")
//            } catch {print("error", error)}
//        }

        
        // Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        // Place camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 75)
        
        // Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)
        
        // Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene?.rootNode.addChildNode(lightNode)
        
        // Creating and adding ambient light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        // If you don't want to fix manually the lights
        // sceneView.autoenablesDefaultLighting = true
        
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        
        // Set background color
        sceneView.backgroundColor = UIColor.white
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        sceneView.scene = scene
        
        return sceneView
    }
    
//    func updateUIView(_ uiView: SCNView, context: Context) {
//        var scene:SCNScene?
//       print("update UI View", appURL ?? "no value")
//        if appURL != nil{
//            do {
//                let objMaterial = SCNMaterial()
//                objMaterial.diffuse.contents = UIImage(named: "texture.png")
//
//                scene = try SCNScene(url: appURL!, options: nil);
//                print("this is SCNscene", scene)
////                scene.materials = [objMaterial]
//                uiView.scene = scene
//                print("obj updated")
//            } catch {print("error", error)}
//        }
//    }
    
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        var scene: SCNScene?
        print("update UI View", appURL ?? "no value")
        if let appURL = appURL {
            do {
                let objMaterial = SCNMaterial()
                objMaterial.diffuse.contents = UIImage(named: "texture.png")

                scene = try SCNScene(url: appURL, options: nil)
//                print("this is SCNscene", scene)

                // Assuming you want to apply the material to all geometries in the scene
                scene?.rootNode.childNodes.forEach { node in
                    if let geometry = node.geometry {
                        geometry.materials = [objMaterial]
                    }
                }

                uiView.scene = scene
                print("obj updated")
            } catch {
                print("error", error)
            }
        }
    }

}

struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        ModelView()
    }
}
