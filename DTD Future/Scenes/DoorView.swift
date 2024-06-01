//
//  DoorView.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DoorView: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("Door")
                .resizable()

            VStack {
                Spacer().frame(height: 400)
                HStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, newValue: "FloorG")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 100)
                }
            }
        }
    }
}

#Preview {
    DoorView()
}