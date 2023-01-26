//
//  KakaoSignInView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/27.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct KakaoSignInView: View {
    var body: some View {
        Button {
            if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    print(oauthToken)
                    print(error)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    print(oauthToken)
                print(error)
                }
            }
        } label : {
            Image("kakao_login_large_wide")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct KakaoSignInView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoSignInView()
    }
}
