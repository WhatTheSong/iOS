//
//  DetailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/18.
//

import SwiftUI

struct DetailView: View {
    @State private var showingBottomView = false
    var body: some View {
        VStack {
            NavigationStack {
                RecordCell(meditation: MeditationData.data[0])

                    .navigationTitle("아 그 노래 뭐더라 ")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem {
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
                    }
                Spacer()
            }
            .overlay(alignment: .bottom) {
                CommentView()
                    .offset(x:0,y:280)
            }
        }
       
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
