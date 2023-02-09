//
//  DetailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/18.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            NavigationStack {
                RecordCell(meditation: MeditationData.data[0])

                    .navigationTitle("아 그 노래 뭐더라 ")
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
               
            }
            .overlay(alignment: .bottom) {
                CommentView()
                    .offset(x:0,y:280)
            }
        }
        .accessibilityElement()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
