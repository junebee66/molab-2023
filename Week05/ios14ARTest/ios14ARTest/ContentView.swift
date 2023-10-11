//
//  ContentView.swift
//  ios14ARTest
//
//  Created by June Bee on 10/4/23.
//

import SwiftUI
import RealityKit
import SwiftUI
import UIKit

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("score") var score:Int = 0
    
    @State private var lightColor = false
    

    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                Text("Welcome, \(username)")
                HStack {
                    Button("Log in") {
                        username = "someone"
                    }
                    Button("Log out") {
                        username = "Anonymous"
                    }
                    Button ("Light Color"){
                        if lightColor {
                            username = "red"
                            ARViewContainerRed()
//                                .edgesIgnoringSafeArea(.all)
                        } else {
                            username = "green"
                            ARViewContainerGreen()
//                                .edgesIgnoringSafeArea(.all)

                        }
                    }

                }
                Text("Score \(score)")
                HStack {
                    Button("+ Store ") {
                        score += 1
                    }
                    Button("- Score") {
                        score -= 1
                    }
                }

                Spacer()
            }.position(x:220, y:50)
            
            HStack {
                ZStack{
                    Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemBlue)).cornerRadius(16)
                    Image(systemName: "figure.walk").resizable().frame(width: 30, height: 30).clipShape(Circle())
                    
                }
                    Spacer()
                
                ZStack{
                    Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemIndigo)).cornerRadius(16)
                    Image(systemName: "sun.max.fill").resizable().frame(width: 30, height: 30).clipShape(Circle())
                }
                    Spacer()
                
                ZStack{
                    
                            Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPurple)).cornerRadius(16)
                Image(systemName: "microbe.fill").resizable().frame(width: 30, height: 30).clipShape(Circle())
                }

                            
                            Spacer()
                ZStack{
                            
                            Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPink)).cornerRadius(16)
                    
                    Image(systemName: "heart.fill").resizable().frame(width: 30, height: 30).clipShape(Circle())
                    }

                        }.padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(20).padding().position(x:220, y:750)

                
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




class LightingRed: Entity, HasPointLight {
    
    required init() {
        super.init()
        
        self.light = PointLightComponent(color: .red,
                                     intensity: 100000,
                             attenuationRadius: 20)
    }
}


class LightingGreen: Entity, HasPointLight {
    
    required init() {
        super.init()
        
        self.light = PointLightComponent(color: .green,
                                     intensity: 100000,
                             attenuationRadius: 20)
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let pointLight = LightingRed().light
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        boxAnchor.components.set(pointLight)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}







struct ARViewContainerRed: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let pointLight = LightingRed().light
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        boxAnchor.components.set(pointLight)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


struct ARViewContainerGreen: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let pointLight = LightingGreen().light
        
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
