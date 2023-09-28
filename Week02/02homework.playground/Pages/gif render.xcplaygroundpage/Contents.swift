import PlaygroundSupport
import UIKit

// Set up the drawing area
let canvasSize = CGSize(width: 400, height: 400)
let canvasView = UIView(frame: CGRect(origin: .zero, size: canvasSize))
canvasView.backgroundColor = UIColor.white

PlaygroundPage.current.liveView = canvasView

// Create an animation view
let animationView = UIImageView(frame: canvasView.bounds)
canvasView.addSubview(animationView)

// Load the individual frames of the animation (replace with your own images)
let frame1 = UIImage(named: "frame1.png")
let frame2 = UIImage(named: "frame2.png")
let frame3 = UIImage(named: "frame3.png")

let frames = [frame1, frame2, frame3].compactMap { $0 }

// Set up animation parameters
animationView.animationImages = frames
animationView.animationDuration = 0.5 // Adjust the duration as needed
animationView.animationRepeatCount = 0 // 0 means repeat indefinitely
animationView.startAnimating()
