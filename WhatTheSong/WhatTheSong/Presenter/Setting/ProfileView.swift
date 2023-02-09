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
                
                Button(action: {
                    
                }) {
                    Text("확 인")
                        .padding()
                }
                .frame(width: 150, height: 40)
                .background(Color.ourOrange)
                .tint(.black)
                .cornerRadius(25)
                
                Spacer()
            }
            .navigationTitle("프로필 ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
