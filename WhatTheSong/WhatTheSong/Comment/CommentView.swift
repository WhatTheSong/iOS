//
//  CommentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                
                Text("커뮤니티 사용자는 커뮤니티 가이드를 준수해야 합니다.")
                    .font(.system(size: 14,weight:.semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .background(Color.yellow)
                    
                Spacer()
                
                List {
                    ForEach(Dummy.comments.indices) { index in
                        CommentCell(comment: Dummy.comments[index])
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("댓글")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text(comment.name)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                Text(comment.date)
                Spacer()
                //TODO: Text("B") -> Button으로 수정
                Text("B")
                    .foregroundColor(.red)
            }
            
            Text(comment.content)
                .padding(EdgeInsets(top: 1, leading: 1, bottom: 10, trailing: 1))
            
            //TODO: 답글 보기 버튼으로 수정
            Text("답글 보기")
                .foregroundColor(.yellow)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}


