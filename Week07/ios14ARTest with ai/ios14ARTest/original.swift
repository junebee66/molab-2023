import SwiftUI
import RealityKit
import ARKit
import UIKit

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("score") var score: Int = 0
    @State private var lightColor = false
    // AI ART
    @State private var promptText = "beautiful landscape"
    @State private var heightText = "360"
    @State private var widthText = "480"
    @State private var isLoading = false
    @State private var image: UIImage?
    @State private var showDownloadButton = false

    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)

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

class LightingGreen: Entity, HasPointLight {
    required init() {
        super.init()
        self.light = PointLightComponent(color: .green, intensity: 100000, attenuationRadius: 20)
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

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
