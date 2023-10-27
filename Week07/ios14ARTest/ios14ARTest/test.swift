//import SwiftUI
//import RealityKit
//import ARKit
//import UIKit
//
//struct ContentView: View {
//    @AppStorage("username") var username: String = "Anonymous"
//    @AppStorage("score") var score: Int = 0
//    @State private var lightColor = false
//
//    // AI ART
//    @State private var promptText = "beautiful landscape"
//    @State private var heightText = "360"
//    @State private var widthText = "480"
//    @State private var isLoading = false
//    @State private var image: UIImage?
//    @State private var showDownloadButton = false
//    @State private var boxTextureURL: URL? // Binding to pass the texture URL
//
//    let customSurfaceShader = CustomMaterial.SurfaceShader { context, baseColor, lightingModel, fragmentInput in
//        return fragmentInput
//    }
//
//    var body: some View {
//        ZStack {
//            ARViewContainer(boxTextureURL: $boxTextureURL)
//
//            VStack {
//                Text("Image Generator")
//                    .font(.title)
//
//                TextField("Prompt", text: $promptText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                HStack {
//                    TextField("Height", text: $heightText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    TextField("Width", text: $widthText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//
//                HStack {
//                    Button(action: generateImage) {
//                        Text("Generate")
//                    }
//                    .frame(width: 100)
//                }
//
//                if isLoading {
//                    ProgressView("Loading...")
//                }
//
//                if let image = image {
//                    Image(uiImage: image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 300, height: 200)
//                        .padding()
//                }
//
//                if showDownloadButton {
//                    Button(action: downloadImage) {
//                        Text("Download")
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//
//    func generateImage() {
//        isLoading = true
//        showDownloadButton = false
//        image = nil
//
//        let description = promptText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "beautiful%20landscape"
//        let randomSeed = Int.random(in: 0..<1_000_000_000)
//        let heightA = Int(heightText) ?? 360
//        let widthA = Int(widthText) ?? 480
//
//        let imageUrl = "https://image.pollinations.ai/prompt/\(description)?nologo=1&seed=\(randomSeed)&height=\(heightA)&width=\(widthA)"
//        print("URL: \(imageUrl)")
//
//        if let url = URL(string: imageUrl) {
//            URLSession.shared.dataTask(with: url) { data, _, _ in
//                if let data = data, let uiImage = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        isLoading = false
//                        image = uiImage
//                        showDownloadButton = true
//
//                        // Save the UIImage to a temporary file
//                        if let imageURL = saveImageToTemporaryFile(uiImage) {
//                            boxTextureURL = imageURL // Store the file URL
//                        }
//                    }
//                }
//            }.resume()
//        }
//    }
//
//    func saveImageToTemporaryFile(_ image: UIImage) -> URL? {
//        do {
//            let tempDirectory = FileManager.default.temporaryDirectory
//            let fileURL = tempDirectory.appendingPathComponent("temp_texture.png")
//            if let imageData = image.pngData() {
//                try imageData.write(to: fileURL)
//                return fileURL
//            }
//        } catch {
//            print("Error saving image to file: \(error)")
//        }
//        return nil
//    }
//
//    func downloadImage() {
//        // Implement the download functionality here, e.g., using UIActivityViewController or other methods.
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    func updateUIView(_ uiView: ARView, context: Context) {
//        <#code#>
//    }
//
//    @Binding var boxTextureURL: URL? // Binding to pass the texture URL
//
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        if let textureURL = boxTextureURL {
//            // Create a custom material with the provided texture and surface shader
//            let customMaterial = CustomMaterial(surfaceShader: customSurfaceShader)
//
//            // Load the texture from the provided URL and set it as the base color texture
//            if let texture = try? TextureResource.load(contentsOf: textureURL) {
//                customMaterial.baseColor.texture = texture
//
//                // Set the custom material on the box
//                boxAnchor.steelBox?.model?.materials[0] = customMaterial
//            }
//        }
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
//        return arView
//    }
//}
