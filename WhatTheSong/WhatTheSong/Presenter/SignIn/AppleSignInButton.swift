//
//  AppleSignInView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/26.
//

import SwiftUI

import AuthenticationServices

struct SignInWithAppleSwiftUIButton: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var userSession: UserSession
    var apiManager = AccountManager()
    
    var body: some View {
        if colorScheme.self == .dark {
            SignInButton(SignInWithAppleButton.Style.whiteOutline)
        }
        else {
            SignInButton(SignInWithAppleButton.Style.black)
        }
    }
    
    func SignInButton(_ type: SignInWithAppleButton.Style) -> some View{
        return SignInWithAppleButton(.signIn) { request in
            
            request.requestedScopes = [.fullName, .email]
            
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                
                guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                    return
                }
                
                if let email = credential.email {
                    UserDefaults.standard.setValue(email, forKey: "AppleEmail")
                }
                
                if let fullName = credential.fullName {
                    guard let family = fullName.familyName, let given = fullName.givenName else { return }
                    let finalName = "\(family) \(given)"
                    UserDefaults.standard.setValue(finalName, forKey: "AppleName")
                }
                
                // 담기 전에, 원래 있던 Apple Id 값이랑
                // 방금 들고온 ID 값이랑 비교를 해서
                // 같아야지 원래 있던 Apple 정보들을 들고오게
            
                let user = credential.user
                
                UserDefaults.standard.setValue(user, forKey: "AppleID")
                
                let email = UserDefaults.standard.string(forKey: "AppleEmail")
                let name = UserDefaults.standard.string(forKey: "AppleName")
                let id = UserDefaults.standard.string(forKey: "AppleID")
                
//                let account: AccountModel = AccountModel(oauthId: id , nickname: name, email: email)
                
                print(email, name, id)
                userSession.signIn()
//                apiManager.postAccount(account: account , platform: .Apple)
                
                
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .frame(width: 280, height: 60, alignment: .center)
        .signInWithAppleButtonStyle(type)
    }
}


struct AppleSignInButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            SignInWithAppleSwiftUIButton()
        }
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInButton()
    }
}
