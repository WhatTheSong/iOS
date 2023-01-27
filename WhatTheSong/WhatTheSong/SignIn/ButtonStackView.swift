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
            AppleSignInButton()
            KakaoSignInButton()
        }
    }
}

struct ButtonStackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStackView()
    }
}
