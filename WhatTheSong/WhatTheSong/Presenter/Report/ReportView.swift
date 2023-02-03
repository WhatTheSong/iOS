//
//  ReportView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI

struct ReportView: View {
    let title: String
    let nickname: String
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(ReportData.data.indices) { index in
                        NavigationLink {
                            Text("Hello")
                        } label: {
                            Text(index.description)
                        }
                        
                    }
                } header: {
                    VStack(alignment: .leading){
                        Text(title)
                        Text("게시물을 신고하는 이유를 선택해주세요.")
                    }
                }
                
                Section{
                    Button {
                        //액션
                    } label: {
                        Text("사용자 신고하러 가기")
                    }

                } header: {
                    VStack(alignment: .leading){
                        Text(nickname)
                        Text("사용자를 신고하고 싶으신가요?")
                    }
                }
                
            }
            .navigationTitle("게시글 신고")
            .scrollContentBackground(.hidden)
        }
    }
}


struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(title: "제목입니당", nickname: "닉네임입니당")
    }
}
