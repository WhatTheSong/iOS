//
//  CategoryView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryView: View {
    let categories = ["발라드", "뮤지컬", "락", "댄스", "랩/힙합", "가요", "클래식", "POP", "인디", "OST", "트로트", "R&B", "JAZZ", "기악"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...(categories.count)/2, id: \.self) { index in
                    VStack {
                        CategoryCell(content: categories[2 * (index - 1)]) // 짝수
                        CategoryCell(content: categories[(2 * index) - 1]) // 홀수
                    }
                    .padding([.top,.bottom],5)
                }
            }
        }
    }
}


 

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
