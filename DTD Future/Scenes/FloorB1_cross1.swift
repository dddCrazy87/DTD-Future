//
//  FloorB1_cross1.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_cross1: View {
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_cross1")
                .resizable()
            
            VStack {
                
                HStack {
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .rotation3DEffect(.degrees(15), axis: (x:0, y:1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_fail_door", video:"FloorB1_cross1 to fail door")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 500)
                }
                
            }
            
            VStack {
                Spacer().frame(height: 300)
                HStack {
                    
                    Spacer().frame(width: 300)
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(40), axis: (x:0, y:0, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_cross2", video:"FloorB1_cross1 to cross2")
                        showAnimToggle(globalState)
                    }
                }
            }
            
            VStack {
                Spacer().frame(height: 500)
                HStack {
                    
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
                        updateViewController(globalState, view: "FloorB1_hobby", video:"none")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 500)
                }
            }
            
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("從地下一樓的電梯走出去後，\n可以看到第一個岔路")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    FloorB1_cross1()
}
