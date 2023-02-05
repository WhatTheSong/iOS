//
//  TitleView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var tabbarItem: TabbarItems
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .padding(.leading, 20)
            Spacer()
            Button {
                let _ = print("About tapped!")
            } label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.trailing, 20)
            .opacity(tabbarItem == .Profile ? 0 : 1)
            
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        .background(Color.ourOrange)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "죄송합니다", tabbarItem: .Home)
    }
}
