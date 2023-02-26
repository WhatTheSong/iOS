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
            VStack(spacing: 40){
                TitleView(title: "설정", tabbarItem: .Profile)
                
                Group{
                    List{
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
                    }
                    .listStyle(InsetListStyle())
                }
                .scrollDisabled(true)
                .frame(width:UIScreen.screenWidth-45, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2))
                
                List{
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
                .scrollDisabled(true)
                .listStyle(InsetListStyle())
                .frame(width:UIScreen.screenWidth-45, height: 130)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2))
            }
            
            Spacer()
                .frame(height: 60)
            
            VStack{
                LogoutButton()
                Spacer()
                    .frame(height: 15)
                LeaveButton()
            }
            
            Spacer()
        }
        .scrollContentBackground(.hidden)
        
        
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
