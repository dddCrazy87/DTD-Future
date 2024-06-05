//
//  FloorGView.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorGView: View {
    
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        ZStack {
            
            Image("FloorG")
                .resizable()

            VStack {
                Spacer().frame(height: 400)
                HStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle) {
                        model in model
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(30), axis: (x:0, y:10, z:0))
                            .phaseAnimator([false, true]) { model, rotationXYZ in
                                model
                                    .rotation3DEffect(.degrees(rotationXYZ ? 30:0), axis: (x:5, y:0, z:0))
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        updateViewController(globalState, view: "FloorB1_hobby", video: "FloorG to FloorB1")
                        showAnimToggle(globalState)
                    }
                    
                    Spacer().frame(width: 1000)
                }
            }
            
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
                        updateViewController(globalState, view: "Floor1_cross", video:"FloorG to Floor1 cross")
                        showAnimToggle(globalState)
                    }
                }
            }
           
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                HStack {
                    
                    Text("這裡是介於地下一樓及一樓之間的「Ｇ樓」\n，也可以稱作電梯平台")
                        .font(.largeTitle)
                        .padding()
                    
                    Button {
                        updateViewController(globalState, view: "Door", video: "none")
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
    FloorGView()
}
