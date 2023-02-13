//
//  DetailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/18.
//

import SwiftUI

struct DetailView: View {
    @State private var showingBottomView = false
    @State private var isShowingReportView = false
    

    var body: some View {
        NavigationStack {
            RecordCell(meditation: MeditationData.data[0], recordCellLocation: .NotHome)
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
                .padding(.top, 20)
            Spacer()
           
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
        .accessibilityElement()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
