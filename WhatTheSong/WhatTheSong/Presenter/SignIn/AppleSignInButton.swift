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
                print("Authorisation successful \(authResults)")
                
                switch authResults.credential {
                case let credential as ASAuthorizationAppleIDCredential:

                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    let userId = credential.user

                    print(email, firstName, lastName, userId)

                default:
                    break
                }
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
