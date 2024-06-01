//
//  FloorB1_fail_door.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_fail_door: View {
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_fail_door")
                .resizable()
            
            VStack {
                Spacer().frame(height: 200)
                HStack {

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
                        updateViewController(globalState, view: "FloorB1_cross1", video:"FloorB1_fail")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 300)
                }
            }
        }
    }
}

#Preview {
    FloorB1_fail_door()
}
