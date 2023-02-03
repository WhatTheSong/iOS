//
//  SettingView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/02.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack{
            List{
                Section {
                    VStack{
                        NavigationLink {
                            ProfileView()
                        } label: {
                            VStack{
                                Text("이름 : ")
                                Spacer()
                                    .frame(height: 20)
                                Text("email : ")
                            }
                        }
                        .multilineTextAlignment(.leading)

                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)     .stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2)
                            .frame(width: 350, height: 82))
                }
                
                Section {
                    Button("알림설정"){}
                    Button("문의하기"){}
                    Button("앱 버전"){}
                }
                
            }
            .navigationTitle("설정")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
