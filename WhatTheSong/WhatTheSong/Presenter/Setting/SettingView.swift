//
//  SettingView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/02.
//

import SwiftUI

struct SettingView: View {
    @State var toggling = false
    let nickname: String = "nil"
    let email: String = "nil"
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        VStack(alignment: .leading){
                            Text("이름 : \(nickname)")
                            Spacer()
                                .frame(height: 20)
                            Text("email : \(email)")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)     .stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2)
                            .frame(width: 350, height: 82))
                }
                
                
                Group{
                    Toggle(isOn: $toggling){
                        Text("알림설정")
                    }
                    
                    NavigationLink {
                        Text("앱버전")
                    } label: {
                        Text("문의하기")
                    }
                    
                    HStack{
                        Text("앱버전")
                        Spacer()
                        Text("1.0.0")
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular)     .stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2)
                        .frame(width: 350, height: 10))
            }
            .navigationTitle("설정")
            .scrollContentBackground(.hidden)
            
            VStack{
                LogoutButton()
                Spacer()
                    .frame(height: 15)
                LeaveButton()
            }
            .offset(x:0, y:-150)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
