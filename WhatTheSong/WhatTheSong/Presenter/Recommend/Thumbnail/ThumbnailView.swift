//
//  ThumbnailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct ThumbnailView: View {
    var body: some View {
        VStack{
            Image("vynil")
                .resizable()
                .frame(width:100,height: 100)

            HStack{
                Text("제목")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Text("100")
                    .font(.system(size: 14))
            }
            HStack{
                Text("간단한 요약...")
                    .font(.system(size: 14))
                Spacer()
            }
        }
        .frame(width: 100, height: 150)
        .padding([.trailing], 20)
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView()
    }
}
