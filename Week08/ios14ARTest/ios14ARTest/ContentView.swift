import SwiftUI
import ARKit
import SceneKit

struct ARKitSceneView: View {
    @State private var promptText = "beautiful landscape"
    @State private var heightText = "360"
    @State private var widthText = "480"
    @State private var isLoading = false
    @State private var image: UIImage?
    @State private var showDownloadButton = false
    @State private var currentTexture = "galaxy.jpg" // Initial texture for the sphere

    var body: some View {
        ZStack {
            ARViewContainer(currentTexture: $currentTexture).id(currentTexture)
            
            HStack{
                Text("AI Texture Generator")
                    .font(.title)
            }
            HStack{
                VStack {
                    
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 200)
                            .padding()
                    }
                }
                .frame(width: 300)
            }
        }
        if isLoading {
            ProgressView("Loading...")
        }
        
        
//        if showDownloadButton {
//            Button(action: downloadImage) {
//                Text("Update Texture")
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//        }
        
        HStack {
            TextField("Height", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Width", text: $widthText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        TextField("Prompt", text: $promptText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
        HStack {
            Button(action: generateImage) {
                Text("Generate")
            }
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .frame(width: 800)
            
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
                        
                        // Convert UIImage to Data as a JPEG image
                        if let imageData = uiImage.jpegData(compressionQuality: 1.0) {
                            // Define a filename for the generated image (e.g., "generatedImage.jpg")
                            let filename = "generatedImage.jpg"
                            
                            // Save the generated image to the app's Documents directory
                            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                                let fileURL = documentsDirectory.appendingPathComponent(filename)
                                
                                do {
                                    try imageData.write(to: fileURL)
                                    currentTexture = filename // Update currentTexture with the filename
                                } catch {
                                    print("Error saving image: \(error)")
                                }
                            }
                        }
                    }
                }
            }.resume()
        }
    }
        
    func downloadImage() {
        // Implement the download functionality here, e.g., using UIActivityViewController or other methods.
        currentTexture = "generatedImage.jpg"
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var currentTexture: String  // Use a binding for the current texture

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
            
            // Load the image from the app's Documents directory
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent(parent.currentTexture)
                if let image = UIImage(contentsOfFile: fileURL.path) {
                    material.diffuse.contents = image
                }
            }
            
            sphere.materials = [material]

            let sphereNode = SCNNode(geometry: sphere)
            sphereNode.position = SCNVector3(0, 0, -0.5)
            sceneView.scene.rootNode.addChildNode(sphereNode)
        }
    }
}
