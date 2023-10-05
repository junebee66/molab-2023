//
//  ContentView.swift
//  ios14ARTest
//
//  Created by June Bee on 10/4/23.
//

import SwiftUI
import RealityKit


class Lighting: Entity, HasPointLight {
    
    required init() {
        super.init()
        
        self.light = PointLightComponent(color: .red,
                                     intensity: 100000,
                             attenuationRadius: 20)
    }
}

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let pointLight = Lighting().light
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        boxAnchor.components.set(pointLight)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
