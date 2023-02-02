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
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Text("이름")
                    }
                    Button("email"){}
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
