//
//  Floor1_car game.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Floor1_car_game: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("Floor1_car game")
                .resizable()
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("據說這是好幾屆前的學長姐做的遊戲機，要不要玩玩看呢？")
                    .font(.largeTitle)
                    .padding()
                
                Button {
                    updateViewController(globalState, view: "bad_end", video:"bad_end")
                    globalState.play1Xspeed = true
                    showAnimToggle(globalState)
                } label: {
                    Text("要")
                        .font(.largeTitle)
                        .padding()
                }
                
                Button {
                    updateViewController(globalState, view: "good_end", video:"good_end")
                    globalState.play1Xspeed = true
                    showAnimToggle(globalState)
                } label: {
                    Text("不要")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    Floor1_car_game()
}
