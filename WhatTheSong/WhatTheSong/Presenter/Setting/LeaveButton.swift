//
//  LeaveButton.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI

struct LeaveButton: View {
    @EnvironmentObject var userSession: UserSession
    var body: some View {
        Button(action: {
            userSession.signOut()
        }) {
                Text("회원탈퇴")
                    .padding()
            }
            .frame(width: 150, height: 40)
            .background(Color.gray)
            .tint(.black)
            .cornerRadius(25)
    }
}

struct LeaveButton_Previews: PreviewProvider {
    static var previews: some View {
        LeaveButton()
    }
}
