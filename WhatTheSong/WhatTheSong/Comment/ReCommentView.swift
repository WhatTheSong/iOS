//
//  ReCommentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import SwiftUI

struct ReCommentView: View {
    var index: Int
    
    var body: some View {
        NavigationStack {
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                //TODO: 색 변경 필요
                CommentCell(comment: Dummy.comments[index])
                    .padding()
                    .background(Color.teal)
                List {
                    ForEach(Dummy.comments.indices) { index in
                        VStack(alignment: .leading){
                            CommentCell(comment: Dummy.comments[index])
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("답글")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ReCommentView_Previews: PreviewProvider {
    static var previews: some View {
        ReCommentView(index: 0)
    }
}
