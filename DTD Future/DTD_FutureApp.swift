//
//  DTD_FutureApp.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/5/30.
//


import SwiftUI

@main
struct DTD_FutureApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(PlayerModel())
                .environmentObject(GlobalState.shared)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
