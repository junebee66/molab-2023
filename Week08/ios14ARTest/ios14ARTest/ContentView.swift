import SwiftUI
import RealityKit
import ARKit
import SceneKit
import UIKit

struct ARKitSceneView: View {
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("score") var score: Int = 0
    @State private var lightColor = false
    @State private var promptText = "beautiful landscape"
    @State private var heightText = "360"
    @State private var widthText = "480"
    @State private var isLoading = false
    @State private var image: UIImage?
    @State private var showDownloadButton = false
    @State private var currentTexture = "mars.jpg" // Initial texture for the sphere

    var body: some View {
        ZStack {
            ARViewContainer(currentTexture: currentTexture).id(currentTexture)

            VStack {
                Text("Image Generator")
                    .font(.title)

                TextField("Prompt", text: $promptText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                HStack {
                    TextField("Height", text: $heightText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Width", text: $widthText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Button(action: generateImage) {
                        Text("Generate")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 100)
                }

                if isLoading {
                    ProgressView("Loading...")
                }

                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                        .padding()
                }

                if showDownloadButton {
                    Button(action: downloadImage) {
                        Text("Download")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    func generateImage() {
        isLoading = true
        showDownloadButton = false
        image = nil

        let description = promptText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "beautiful%20landscape"
        let randomSeed = Int.random(in: 0..<1000000000)
        let heightA = Int(heightText) ?? 360
        let widthA = Int(widthText) ?? 480

        let imageUrl = "https://image.pollinations.ai/prompt/\(description)?nologo=1&seed=\(randomSeed)&height=\(heightA)&width=\(widthA)"
        print("URL: \(imageUrl)")

        if let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        isLoading = false
                        image = uiImage
                        showDownloadButton = true
                        // Update the currentTexture to the generated image
                        currentTexture = "generatedImage.jpg" // Change to an appropriate filename
                    }
                }
            }.resume()
        }
    }

    func downloadImage() {
        // Implement the download functionality here, e.g., using UIActivityViewController or other methods.
    }
}

class LightingRed: Entity, HasPointLight {
    required init() {
        super.init()
        self.light = PointLightComponent(color: .red, intensity: 100000, attenuationRadius: 20)
    }
}

struct ARViewContainer: UIViewRepresentable {
    var currentTexture: String

    func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.delegate = context.coordinator
        sceneView.showsStatistics = true

        let scene = SCNScene()
        sceneView.scene = scene

        context.coordinator.updateScene(sceneView)

        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)

        return sceneView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {
        context.coordinator.updateScene(uiView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        let parent: ARViewContainer

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        func updateScene(_ sceneView: ARSCNView) {
            // Remove existing nodes from the scene
            sceneView.scene.rootNode.childNodes.forEach { $0.removeFromParentNode() }

            // Create a new sphere with the current texture
            let sphere = SCNSphere(radius: 0.2)
            let material = SCNMaterial()
            material.diffuse.contents = UIImage(named: parent.currentTexture)
            sphere.materials = [material]

            let sphereNode = SCNNode(geometry: sphere)
            sphereNode.position = SCNVector3(0, 0, -0.5)
            sceneView.scene.rootNode.addChildNode(sphereNode)
        }
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ARKitSceneView()
    }
}
#endif
