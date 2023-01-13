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
