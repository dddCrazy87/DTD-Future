//
//  FloorB1_hobby.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_hobby: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_hobby")
                .resizable()
            
            VStack {
                Spacer().frame(height: 200)
                HStack {
                    
                    Spacer().frame(width: 500)
                    
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(40), axis: (x:0, y:100, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_cross1", video:"FloorB1_hobby to Cross1")
                        showAnimToggle(globalState)
                    }
                }
            }
        }
    }
}

#Preview {
    FloorB1_hobby()
}
