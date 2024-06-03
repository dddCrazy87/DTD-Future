//
//  Floor1_cross.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Floor1_cross: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("Floor1_cross")
                .resizable()
            
            VStack {
                Spacer().frame(height: 400)
                HStack {
                    
                    
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(100), axis: (x:0, y:1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "Floor1_classrooms", video:"Floor1 cross to classrooms")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 300)
                    
                }
            }
            
            VStack {
                Spacer().frame(height: 600)
                HStack {
                    
                    
                    Spacer().frame(width: 300)
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(60), axis: (x:1, y:0, z:0))
                            .rotation3DEffect(.degrees(200), axis: (x:0, y:1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorG", video:"none")
                        showAnimToggle(globalState)
                    }
                    
                }
            }
            
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("右手邊是數位系的交誼區，下課後大家都會聚在這裡聊天。\n這裡有插座、沙發和電風扇，但是沒有冷氣")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    Floor1_cross()
}
