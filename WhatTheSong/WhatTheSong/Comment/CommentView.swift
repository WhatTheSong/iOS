//
//  CommentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import SwiftUI

struct CommentView: View {
    @State private var selection: Int = 0
    @State var isPresent = false
    
    var body: some View {
        NavigationStack {
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
                        VStack(alignment: .leading){

                            CommentCell(comment: Dummy.comments[index])
                                
                            Button(action: {
                                isPresent.toggle()
                                selection = index
                            }) {
                                Text("답글 보기")
                                    .foregroundColor(Color.yellow)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        .navigationDestination(isPresented: $isPresent, destination: {
                            ReCommentView(index: selection)
                        })
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("댓글")
            .navigationBarTitleDisplayMode(.large)
            
            
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}


