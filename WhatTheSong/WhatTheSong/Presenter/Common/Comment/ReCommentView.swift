//
//  ReCommentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import SwiftUI

struct ReCommentView: View {
    var index: Int
    @Binding var isShowingReportView: Bool
    
    var body: some View {
        NavigationStack {
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(.ultraThinMaterial)
                //TODO: 색 변경 필요
                CommentCell(isShowingReportView: $isShowingReportView , comment: Dummy.comments[index])
                    .padding()
                    .background(Color.yellow)
                List {
                    ForEach(Dummy.reComments.indices) { index in
                        VStack(alignment: .leading){
                            CommentCell(isShowingReportView: $isShowingReportView , comment: Dummy.reComments[index])
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("답글")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(isPresented: $isShowingReportView) {
                //TODO: 이름 변경
                ReportView(title: "HI", nickname: "HI")
            }
        }
    }
}

struct ReCommentView_Previews: PreviewProvider {
    static var previews: some View {
        ReCommentView(index: 0, isShowingReportView: .constant(false))
    }
}
