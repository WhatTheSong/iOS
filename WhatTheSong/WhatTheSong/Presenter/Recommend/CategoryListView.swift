//
//  CategoryListView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryListView: View {
    var category = "발라드"
    let items: [String] = ["1", "2", "3", "4", "5", "6"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { category in
                    CategoryListCell()
                        .padding()
                }
                .listRowSeparator(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CategoryCell(content: category, stateOfCategroy: .small, isFilled: true)
                }
            }
            .listStyle(.inset)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
