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
            
            VStack {
                Spacer().frame(height: 400)
                HStack {
                    
                    Spacer().frame(width: 450)
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(50), axis: (x:1, y:0, z:0))
                            .rotation3DEffect(.degrees(170), axis: (x:0, y:1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "Floor1_drawing wall", video:"none")
                        showAnimToggle(globalState)
                    }
                    
                    
                    
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("這是一個電動玩具，坐上去會發生什麼事呢？")
                    .font(.largeTitle)
                    .padding()
                
                Button {
                    updateViewController(globalState, view: "Door", video:"none")
                } label: {
                    Text("回到門外")
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
