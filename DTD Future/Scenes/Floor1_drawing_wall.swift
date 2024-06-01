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
        }
    }
}

#Preview {
    Floor1_drawing_wall()
}
