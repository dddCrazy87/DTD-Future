//
//  Floor1_classrooms.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Floor1_classrooms: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("Floor1_classrooms")
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
                            .rotation3DEffect(.degrees(100), axis: (x:0, y:-1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "Floor1_drawing_wall", video:"Floor1_classroom to drawing wall")
                        showAnimToggle(globalState)
                    }
                    
                    
                    
                }
            }
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("這裡是數位系的教室。有AR和VR的未來互動教室，\n也有專屬於Mac系統的電腦教室。")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    Floor1_classrooms()
}
