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
            Text("變成知名便利商店刷條碼的員工，\n下班時間摸魚還被老闆抓包，\n是數位系的恥辱！")
                .font(.largeTitle)
            
            Button {
                updateViewController(GlobalState.shared, view: "StartView", video: "none")
            } label: {
                Text("重新開始")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    bad_end()
}
