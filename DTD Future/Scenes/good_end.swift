//
//  good_end.swift
//  DTD Future
//
//  Created by 許昀韋 on 2024/6/5.
//

import SwiftUI

struct good_end: View {
    var body: some View {
        VStack {
            Text("你成為了知名遊戲公司的遊戲設計師，\n身價破億，\n是數位系的驕傲！")
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
    good_end()
}
