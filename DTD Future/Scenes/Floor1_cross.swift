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
        }
    }
}

#Preview {
    Floor1_cross()
}
