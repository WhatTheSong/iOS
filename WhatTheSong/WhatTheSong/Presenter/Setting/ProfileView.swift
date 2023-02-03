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
        NavigationStack{
            VStack{
                List{
                    Section {
                        TextField("이름 입력하세요", text: $name)
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
                .navigationTitle("프로필")
                .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
                    .frame(height: 10)
                
                Button {
                    //action
                } label: {
                    Text("완료")
                }
                .frame(width: 120, height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.ourOrange, lineWidth: 2))
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
