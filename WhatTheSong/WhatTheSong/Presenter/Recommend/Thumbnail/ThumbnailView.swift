//
//  ThumbnailView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct ThumbnailView: View {
    var item: RecommendBoard
    
    
    var body: some View {
        VStack(alignment: .center){
            Image(item.imageName)
                .resizable()
                .frame(width:100,height: 100)

            HStack{
                Text(item.title)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
//                Text("100")
//                    .font(.system(size: 14))
            }
            HStack{
                Text(item.description)
                    .font(.system(size: 14))
                Spacer()
            }
        }
        .frame(width: 130, height: 150)
        .padding([.trailing], 20)
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(item: RecommendBoard(title: "D", description: "D", imageName: "D", category: .Rock))
    }
}
