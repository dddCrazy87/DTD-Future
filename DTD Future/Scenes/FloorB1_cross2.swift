//
//  FloorB1_cross2.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_cross2: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_cross2")
                .resizable()
            
            VStack {
                Spacer().frame(height: 200)
                HStack {
                    
                    Spacer().frame(width: 300)
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(40), axis: (x:0, y:-1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_cross2_right", video:"FloorB1_Cross2 to right")
                        showAnimToggle(globalState)
                    }
                    
                    
                }
            }
            
            VStack {
                Spacer().frame(height: 400)
                HStack {
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(60), axis: (x:1, y:0, z:0))
                            .rotation3DEffect(.degrees(150), axis: (x:0, y:-1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_cross1", video:"none")
                        showAnimToggle(globalState)
                    }
                    
                        
                    Spacer().frame(width: 300)
                    
                }
            }
            
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("這裡是數位系的實驗室和辦公室，\n勤奮向上的好同學都會窩在這裡進行研究")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    FloorB1_cross2()
}
