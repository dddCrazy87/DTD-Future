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
                        updateViewController(globalState, view: "FloorG", video: "Door to FloorG")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 100)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                
                Text("看似小小的側門，其實是創意館的大門！\n數位系的大家會從這裡進入創意館...")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

#Preview {
    DoorView()
}
