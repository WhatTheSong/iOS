//
//  CategoryListCell.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryListCell: View {
    var body: some View {
        VStack{
            NavigationLink(destination: RecommendDetailView()) {
                HStack {
                    Image("vynil")
                        .resizable()
                        .frame(width:50,height: 50)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        HStack{
                           stereoEffect()
                            VStack(alignment: .leading) {
                                Text ("제목")
                                    .font(.system(size: 18, weight: .semibold))
                                Text("간단한 요약")
                                
                            }
                            Spacer()
                            Text("100")
                                .padding()
                        }
                        Rectangle()
                            .frame(width: UIScreen.screenWidth - 70,height: 2)
                            .foregroundColor(.ourOrange)
                    }
                }
            }
            
            
        
        }
    }
    
    func stereoEffect() -> some View {
        var result = HStack(spacing: 1) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 2, height: 40)
                .foregroundColor(.ourOrange)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 2, height: 30)
                .foregroundColor(.ourOrange)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 2, height: 20)
                .foregroundColor(.ourOrange)
        }
        
        return result
    }
}

struct CategoryListCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListCell()
    }
}
