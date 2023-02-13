//
//  RecommendDetailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/04.
//

import SwiftUI

struct RecommendDetailView: View {
    @State var isShowingReportView: Bool = false
    @State private var showingBottomView = false
    
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
                            
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            showingBottomView.toggle()
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)

                        })
                        .buttonStyle(BorderlessButtonStyle())
                        .confirmationDialog("신고하기",
                                            isPresented: $showingBottomView,
                                            titleVisibility: .hidden)
                        {
                            Button("신고하기") {
                                self.isShowingReportView = true
                            }
                        }
                    }
                }
                .navigationTitle("아 그 노래 뭐더라 ")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isShowingReportView) {
                    //TODO: 이름 변경
                    ReportView(title: "HI", nickname: "HI")
                }
                .padding(.bottom, UIScreen.screenHeight - 375)
            }
            .overlay(alignment: .bottom) {
                Group{
                    if !isShowingReportView{
                        CommentView(isShowingReportView: $isShowingReportView)
                            .offset(x:0,y:280)
                            .transition(.move(edge: .bottom))
                    }
                }
                .animation(.easeIn, value: isShowingReportView)
            }
        }
    }
}

struct RecommendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendDetailView()
    }
}
