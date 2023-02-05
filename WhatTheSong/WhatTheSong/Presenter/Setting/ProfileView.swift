//
//  ProfileView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/02.
//

import SwiftUI

struct ProfileView: View {
    @State var name = ""
    
    var body: some View {
        VStack{
            List{
                Section {
                    TextField("", text: $name)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .circular)     .stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2)
                                .frame(width: 350, height: 40))
                } header: {
                    Text("이름")
                } footer: {
                    Text("2~8글자를 입력해주세요.")
                }
            }
            .scrollContentBackground(.hidden)
            
            LogoutButton()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
