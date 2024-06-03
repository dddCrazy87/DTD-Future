//
//  Floor1_drawing wall.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Floor1_drawing_wall: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("Floor1_drawing wall")
                .resizable()
            
            VStack {
                Spacer().frame(height: 400)
                HStack {
                    
                    Spacer().frame(width: 700)
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(30), axis: (x:0, y:-1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "Floor1_car_game", video:"Floor1 drawing to car game")
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
                            .rotation3DEffect(.degrees(50), axis: (x:1, y:0, z:0))
                            .rotation3DEffect(.degrees(130), axis: (x:0, y:1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "Floor1_classrooms", video:"none")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 500)

                }
            }
            
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("這是專屬於數位系的白板塗鴉牆。因為大家都很喜歡也很會畫畫，\n所以平常無聊的時候就會在這邊撇個兩筆。")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    Floor1_drawing_wall()
}
