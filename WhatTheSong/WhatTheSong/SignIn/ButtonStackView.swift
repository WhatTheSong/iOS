//
//  ButtonStackView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/28.
//

import SwiftUI

struct ButtonStackView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("로그인하고")
                Text("\"아 그 노래 뭐더라\"")
                Text("사용하기")
            }
            .padding(20)
            .font(.system(size: 28,weight:.bold))
            AppleSignInButton()
            KakaoSignInButton()
            Spacer()
            HStack {
                Spacer()
                Text("개인정보 처리방침")
                Spacer()
                Text("이용 약관")
                Spacer()
            }
            Spacer()
        }
    }
}

struct ButtonStackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStackView()
    }
}
