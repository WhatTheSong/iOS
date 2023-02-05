//
//  RecommendView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/04.
//

import SwiftUI

struct RecommendView: View {
    
    let people = ["서근", "슬기", "나비", "희진"]
    let categories = ["발라드", "뮤지컬", "락", "댄스", "힙합", "K-POP", "클래식", "POP"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("추천")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.leading, 20)
                    Spacer()
                    Button {
                        print("About tapped!")
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .padding(.trailing, 20)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                
                List {
                    Section{
                        categoryHeader(title: "카테고리")
                        CategoryView()
                            .listRowSeparator(.hidden)
                    }
                    ForEach(categories, id: \.self) { category in
                        Section {
                            categoryHeader(title: category)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0...5, id: \.self) { index in
                                        ThumbnailView()
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
