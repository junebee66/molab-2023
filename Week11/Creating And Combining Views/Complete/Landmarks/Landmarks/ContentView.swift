/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 600)
            
            ModelView()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
                .frame(height: 150)

//            CircleImage()
//                .offset(x: 0, y: -130)
//                .padding(.bottom, -130)

                VStack(alignment: .leading) {
                Text("Movie Title")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("2023/3/24")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }.padding(.bottom, 0)
            }
            .padding()

            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
