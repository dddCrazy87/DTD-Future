//
//  bad_end.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/5.
//

import SwiftUI

struct bad_end: View {
    var body: some View {
        VStack {
            Text("變成便利商店刷條碼的員工，\n下班時間摸魚還被老闆抓包，\n是數位系的恥辱！")
                .font(.largeTitle)
            
            HStack {
                
                Button {
                    updateViewController(GlobalState.shared, view: "StartView", video: "none")
                } label: {
                    Text("重新開始")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
                Button {
                    updateViewController(GlobalState.shared, view: "Floor1_car_game", video: "none")
                } label: {
                    Text("試試別的結局")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    bad_end()
}
