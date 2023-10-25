////
////  ContentView.swift
////  aiArt
////
////  Created by June Bee on 10/19/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var promptText = "beautiful landscape"
//    @State private var heightText = "360"
//    @State private var widthText = "480"
//    @State private var isLoading = false
//    @State private var image: UIImage?
//    @State private var showDownloadButton = false
//
//    var body: some View {
//        VStack {
//            Text("Image Generator")
//                .font(.title)
//
//            TextField("Prompt", text: $promptText)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            HStack {
//                TextField("Height", text: $heightText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("Width", text: $widthText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//
//            HStack {
//                Button(action: generateImage) {
//                    Text("Generate")
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//                .frame(width: 100)
//            }
//
//            if isLoading {
//                ProgressView("Loading...")
//            }
//
//            if image != nil {
//                Image(uiImage: image!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 200)
//                    .padding()
//            }
//
//            if showDownloadButton {
//                Button(action: downloadImage) {
//                    Text("Download")
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//            }
//        }
//        .padding()
//    }
//
//    func generateImage() {
//        isLoading = true
//        showDownloadButton = false
//        image = nil
//
//        let description = promptText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "beautiful%20landscape"
//        let randomSeed = Int.random(in: 0..<1000000000)
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
//                    }
//                }
//            }.resume()
//        }
//    }
//
//    func downloadImage() {
//        // Implement the download functionality here, e.g., using UIActivityViewController or other methods.
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
