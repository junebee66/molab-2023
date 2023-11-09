import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var arView: ARView

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return arView
    }
    
    func setupARView() {
        arView.session.delegate = self
        setARViewOptions()
        let configuration = buildConfigure()
        arView.session.run(configuration)
    }


    func updateUIView(_ uiView: ARView, context: Context) {
        // Update the ARView if needed
    }
}

class ExportViewModel: ObservableObject, ARSessionDelegate {
    func isEqual(_ object: Any?) -> Bool {
        // Your custom implementation for isEqual
        return false
    }

    var hash: Int {
        // Your custom implementation for hash
        return 0
    }

    var superclass: AnyClass? {
        // Your custom implementation for superclass
        return nil
    }

    func `self`() -> Self {
        // Your custom implementation for self
        return self
    }

    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        // Your custom implementation for perform
        return nil
    }

    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        // Your custom implementation for perform with object
        return nil
    }

    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        // Your custom implementation for perform with two objects
        return nil
    }

    func isProxy() -> Bool {
        // Your custom implementation for isProxy
        return false
    }

    func isKind(of aClass: AnyClass) -> Bool {
        // Your custom implementation for isKind
        return false
    }

    func isMember(of aClass: AnyClass) -> Bool {
        // Your custom implementation for isMember
        return false
    }

    func conforms(to aProtocol: Protocol) -> Bool {
        // Your custom implementation for conforms
        return false
    }

    func responds(to aSelector: Selector!) -> Bool {
        // Your custom implementation for responds
        return false
    }
    var description: String = ""

    @Published var arView = ARView()

    func setupARView() {
        arView.session.delegate = self
        setARViewOptions()
        let configuration = buildConfigure()
        arView.session.run(configuration)
    }

    func setARViewOptions() {
        arView.debugOptions.insert(.showSceneUnderstanding)
    }

    func buildConfigure() -> ARWorldTrackingConfiguration {
        let configuration = ARWorldTrackingConfiguration()
        configuration.environmentTexturing = .automatic
        configuration.sceneReconstruction = .mesh
        if type(of: configuration).supportsFrameSemantics(.sceneDepth) {
            configuration.frameSemantics = .sceneDepth
        }
        return configuration
    }

    func convertToAsset(meshAnchors: [ARMeshAnchor]) -> MDLAsset? {
        guard let device = MTLCreateSystemDefaultDevice() else { return nil }

        let asset = MDLAsset()

        for anchor in meshAnchors {
            if let camera = arView.session.currentFrame?.camera {
                let mdlMesh = anchor.geometry.toMDLMesh(device: device, camera: camera, modelMatrix: anchor.transform)
                asset.add(mdlMesh)
            }
        }

        return asset
    }

    func export(asset: MDLAsset) throws -> URL {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = directory.appendingPathComponent("scanned.obj")

        try asset.export(to: url)

        return url
    }

    func share(url: URL, sender: UIView) {
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            let vc = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = sender
            viewController.present(vc, animated: true, completion: nil)
        }
    }

    func export() {
        guard let camera = arView.session.currentFrame?.camera else { return }

        if let meshAnchors = arView.session.currentFrame?.anchors.compactMap({ $0 as? ARMeshAnchor }),
           let asset = convertToAsset(meshAnchors: meshAnchors) {
            do {
                let url = try export(asset: asset)
                share(url: url, sender: arView)
            } catch {
                print("export error")
            }
        }
    }

    // Implement ARSessionDelegate methods if needed
}

struct ExportView: View {
    @StateObject private var viewModel = ExportViewModel()

    var body: some View {
        VStack {
            ARViewContainer(arView: $viewModel.arView)
                .edgesIgnoringSafeArea(.all)

            Button("Export") {
                viewModel.export()
            }
        }
        .onAppear {
            viewModel.setupARView()
            print("show export view")
        }
    }
}

//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
