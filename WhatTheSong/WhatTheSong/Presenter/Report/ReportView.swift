//
//  ReportView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI

struct ReportView: View {
    let reportReason:[String] = [
        "신고사유1",
        "신고사유2",
        "신고사유3",
        "신고사유4",
        "신고사유5"
    ]
    @State private var selection: String? = ""
    
    @State var title: String
    var nickname: String
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    Text("'\(title)'")
                    Spacer()
                        .frame(height: 10)
                    Text("게시물을 신고하는 이유를 선택해주세요.")
                        .bold()
                }
                .offset(x:10, y:10)
                
                Spacer()
                    .frame(height: 30)
                
                List(reportReason, id: \.self, selection: $selection) { index in
                    HStack{
                        Text(index)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                }
                .listStyle(InsetListStyle())
                .frame(width:350, height: 220)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2))
                
                Spacer()
                    .frame(height: 30)
                
                VStack(alignment: .leading){
                    Text("'\(nickname)'")
                    Spacer()
                        .frame(height: 10)
                    Text("사용자를 신고하고 싶으신가요?")
                        .bold()
                }
                .offset(x:10, y:10)
                
                NavigationLink(destination: ReportSendView(selection: $selection, title: $title)) {
                    Text("사용자 신고하러 가기")
                }
                .disabled(selection == "")
                .frame(width: UIScreen.screenWidth-40, height:35)
                .tint(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(UIColor(Color.ourOrange)), lineWidth: 2))
                .offset(y:15)
                
                
                Spacer()
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
