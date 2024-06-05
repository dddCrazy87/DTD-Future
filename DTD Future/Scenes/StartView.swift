//
//  StartView.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/5.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            Image("Door")
                .resizable()
            
            VStack {
                Text("這是一個帶領你認識數位系的軟體")
                    .foregroundColor(.yellow)
                    .padding(3)
                Text("跟著我們的腳步")
                    .foregroundColor(.yellow)
                    .padding(3)
                Text("一起認識數位系、了解數位系的未來吧！")
                    .foregroundColor(.yellow)
                    .padding(3)
                Button {
                    updateViewController(GlobalState.shared, view: "Door", video: "none")
                } label: {
                    Text("進入系館！")
                }
            }
            .font(.largeTitle)
            .padding()
            .background(Color.gray)
            .cornerRadius(30)
        }
    }
}

#Preview {
    StartView()
}
