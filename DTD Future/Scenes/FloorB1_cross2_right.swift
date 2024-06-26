//
//  FloorB1_cross2_right.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/2.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorB1_cross2_right: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorB1_cross2_right")
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
                            .rotation3DEffect(.degrees(40), axis: (x:0, y:-1, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_goal", video:"FloorB1_Cross2 to Goal")
                        showAnimToggle(globalState)
                    }
                    
                    
                }
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                HStack {
                    
                    Text("沒想到左邊竟然堆滿雜物...")
                        .font(.largeTitle)
                        .padding()
                    
                    Button {
                        updateViewController(globalState, view: "FloorB1_cross2", video: "none")
                    } label: {
                        Text("返回前一處")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .background(Color.gray)
                    .cornerRadius(32)
                }
            }
        }
    }
}

#Preview {
    FloorB1_cross2_right()
}
