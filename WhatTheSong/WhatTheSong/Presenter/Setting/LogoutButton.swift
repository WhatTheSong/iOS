//
//  LogoutButton.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI

struct LogoutButton: View {
    var body: some View {
        Button(action: {
            
        }) {
                Text("로그아웃")
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
