//
//  RecommendView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/04.
//

import SwiftUI

struct RecommendView: View {
    @State var selectedCategoryNameFinal: String?
    @State var categoryNameFinal: String?
    
    func setCategoryName() {
        self.categoryNameFinal = selectedCategoryNameFinal
        print("마지막 \(categoryNameFinal)")
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TitleView(title: "추천", tabbarItem: .Recommend)
            
                List {
                    Section{
                        categoryHeader(title: "카테고리")
                        CategoryView(stateOfCategory: .small, categoryName: $selectedCategoryNameFinal)
                            .listRowSeparator(.hidden)
                    }
                    ForEach(Categories.allCases, id: \.self) { category in
                        Section {
                            categoryHeader(title: category.rawValue)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(Dummy.recommendBoards, id: \.self) { item in
                                        if item.category == category {
                                            NavigationLink(destination: RecommendDetailView(recommendData: item)) {
                                                ThumbnailView(item: item)
                                                Spacer()
                                                    .frame(width: 30)
                                            }
                                           
                                        }
                                    }
                                }
                                
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listStyle(.plain)
           
            }

        }

        
    }
}

struct categoryHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 20,weight:.bold))
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
