//
//  CategoryCell.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryCell: View {
    var content: String
    var isFilled: Bool = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(isFilled ? Color.ourOrange : .white)
            .frame(width: 75, height: 25)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.ourOrange, lineWidth: 2)
            )
            .overlay {
                Text(content)
                    .font(.system(size: 14,weight:.semibold))
            }
            
            
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(content: "뭐지")
    }
}
