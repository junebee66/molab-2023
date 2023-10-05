//
//  VisionOsTest2App.swift
//  VisionOsTest2
//
//  Created by June Bee on 10/4/23.
//

import SwiftUI

@main
struct VisionOsTest2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
