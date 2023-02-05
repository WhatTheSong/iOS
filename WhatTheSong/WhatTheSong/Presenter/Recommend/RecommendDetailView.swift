//
//  RecommendDetailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/04.
//

import SwiftUI

struct RecommendDetailView: View {
    var body: some View {
        VStack {
            NavigationStack {
                // 게시글 사진
                Image("vynil")
                    .resizable()
                    .frame(width:100,height: 100)
                // 좋아요 숫자
                Text("좋아요 숫자")
                // 게시글 내용
                Group {
                    VStack {
                        Spacer()
                        Text("내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용")
                            .background(.red)
                    }
                }
                .padding(.bottom, UIScreen.screenHeight - 375)
                .navigationTitle("아 그 노래 뭐더라 ")
                .navigationBarTitleDisplayMode(.inline)
                .background(.blue)
                
            }
            .overlay(alignment: .bottom) {
                CommentView()
                    .offset(x:0,y:280)
            }
        }
    }
}

struct RecommendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendDetailView()
    }
}
