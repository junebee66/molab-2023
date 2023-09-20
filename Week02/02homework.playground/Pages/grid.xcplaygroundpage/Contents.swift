import SwiftUI
import PlaygroundSupport
import UIKit


func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

// profile image
let u1 = "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNnhpYnE2eHNrdWwweDUydzAza3VwcXVteDAyaXFuN205Zmp2NDV4biZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/vilrxqdiL82Qyxyh3f/giphy.gif"
let ui1 = imageFor(u1)

// itp staff
let u2 = "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/dan-osullivan1.jpg.preset.square.jpeg"
let ui2 = imageFor(u2)

let sz = CGSize(width: 200, height: 200)
let renderer = UIGraphicsImageRenderer(size: sz)

let image = renderer.image { (context) in
    ui1.draw(in: CGRect(x: 0, y: 0, width: 100, height: 100))
    ui2.draw(in: CGRect(x: 100, y: 0, width: 100, height: 100))

}

ui1

struct Screen: View {
    var body: some View {
        Image(uiImage:ui2).resizable().frame(width: 130, height: 130).clipShape(Circle())
        VStack {
            ForEach(1...4, id: \.self) { _ in
                HStack {
                    Spacer()
                    VStack {
                        Image(uiImage:ui1).resizable().frame(width: 30, height: 30).clipShape(Circle())
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemRed)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                
                    }
                    Spacer()
                    VStack {
//                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemOrange)).cornerRadius(16)
                        Image(systemName: "tree").resizable().frame(width: 30, height: 30).clipShape(Circle()).symbolEffect(.pulse)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemYellow)).cornerRadius(16)
                        Text("AppY").font(.footnote).padding(.top, 2)
                        
                    }
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemGreen)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                }
            }.padding(.top)
            
            Spacer()
            
            HStack {
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemBlue)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemIndigo)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPurple)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPink)).cornerRadius(16)
            }.padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(20).padding()
        }
    }
}



PlaygroundPage.current.setLiveView(Screen())

