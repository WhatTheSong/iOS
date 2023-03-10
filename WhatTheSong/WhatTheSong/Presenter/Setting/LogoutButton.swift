//
//  LogoutButton.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI

struct LogoutButton: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        Button(action: {
            userSession.signOut()
        }) {
                Text("๋ก๊ทธ์์")
                    .padding()
            }
            .frame(width: 150, height: 40)
            .background(Color.ourOrange)
            .tint(.black)
            .cornerRadius(25)
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
