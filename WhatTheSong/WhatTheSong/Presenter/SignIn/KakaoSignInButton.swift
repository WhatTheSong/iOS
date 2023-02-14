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

struct KakaoSignInButton: View {
    @EnvironmentObject var userSession: UserSession
    var apiManager = AccountManager()
    var body: some View {
        Button {
            signInKakao()
        } label : {
            Image("kakao_login_large_wide")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : UIScreen.main.bounds.width * 0.9)
        }
    }
    
    func signInKakao() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
               getUserInfo()
                userSession.signIn()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               getUserInfo()
                userSession.signIn()
            }
        }
    }
    
    func getUserInfo() {
        var account : AccountModel?
        UserApi.shared.me { (user, err) in
            if let err = err {
                print("getUserInfo Err: ",err)
                account = nil
            }
            else {
                print("me() success.")
                
                let userId: String = String(user?.id ?? 0)
                let nickName: String = user?.kakaoAccount?.profile?.nickname ?? "Nil"
                let email: String =  user?.kakaoAccount?.email ?? "Nil"
                account = AccountModel(oauthId: userId  ,nickname: nickName, email: email)
                
                guard let result = account else { return }
                apiManager.postAccount(account: result)
            }
        }
    }
}

struct KakaoSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        KakaoSignInButton()
    }
}
