//
//  FloorB1_goal.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_goal: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_goal")
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
                            .rotation3DEffect(.degrees(220), axis: (x:0, y:1, z:0))
                            .rotation3DEffect(.degrees(60), axis: (x:-1, y:0, z:0))
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
                    
                    
                }
            }
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("再往前就是廁所及雜物間，這就是地下室的全貌\n接著我們回到電梯平台吧！")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    FloorB1_goal()
}
