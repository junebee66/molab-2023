import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    @State private var showParticles = false
    
    var body: some View {
        ZStack {
            if showParticles {
                ParticleView()
                    .transition(.opacity)
            } else {
                VStack {
                    Text("Tap to Generate Particles")
                        .font(.headline)
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                showParticles.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct ParticleView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ParticleEmitterView(rect: geometry.frame(in: .local))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ParticleEmitterView: UIViewRepresentable {
    let rect: CGRect

    func makeUIView(context: Context) -> UIView {
        let particleEmitter = CAEmitterLayer()
        particleEmitter.emitterPosition = CGPoint(x: rect.width / 2, y: -20)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: rect.width/2, height: 1)
        particleEmitter.renderMode = .additive

        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spin = 2
        cell.spinRange = 1
        cell.scaleRange = 0.001
        cell.scaleSpeed = -0.09
        //can change image to particle/shapes/shapes-B
        cell.contents = UIImage(named: "particle")?.cgImage
//        cell.contents = UIImage(named: "shapes-B")?.cgImage
//        cell.contents = UIImage(named: "shapes")?.cgImage
        //can change image to particle/shapes/shapes-B

        particleEmitter.emitterCells = [cell]

        let view = UIView(frame: rect)
        view.layer.addSublayer(particleEmitter)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
