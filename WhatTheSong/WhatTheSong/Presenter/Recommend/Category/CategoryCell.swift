//
//  CategoryCell.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryCell: View {
    var content: String
    var stateOfCategroy: StateOfCategory
    var isFilled: Bool = false
    
    
    var body: some View {
        if stateOfCategroy == .small {
            if isFilled {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.ourOrange)
                    .frame(width: 75, height: 25)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.ourOrange, lineWidth: 2)
                    )
                    .overlay {
                        Text(content)
                            .font(.system(size: 14, weight:.semibold))
                    }
            }
            else {
                NavigationLink(destination: CategoryListView(category: content)) {
                    Text(content)
                        .font(.system(size: 14,weight:.semibold))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 75, height: 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.ourOrange, lineWidth: 2)
                        )
                }
            }
            
            
        }
        else if stateOfCategroy == .large {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: 150, height: 50)
                .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.ourOrange, lineWidth: 2)
                )
                .overlay {
                    Text(content)
                        .font(.system(size: 20, weight:.semibold))
                }
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(content: "뭐지", stateOfCategroy: .small)
    }
}
