//
//  CommentCell.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/17.
//

import SwiftUI

struct CommentCell: View {
    @State private var showingBottomView = false
    let comment: Comment
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text(comment.name)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                
                Text(comment.date)
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                Button(action: {
                    showingBottomView.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)

                })
                .buttonStyle(BorderlessButtonStyle())
                .confirmationDialog("신고하기", isPresented: $showingBottomView,titleVisibility: .hidden) {
                    Button("신고하기") {
                        //TODO: 신고 기능 넣기
                        print("HI")
                    }
                }
            }
            
            Text(comment.content)
                .padding(EdgeInsets(top: 1, leading: 1, bottom: 10, trailing: 1))
            
        }
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: Dummy.comments[0])
    }
}
