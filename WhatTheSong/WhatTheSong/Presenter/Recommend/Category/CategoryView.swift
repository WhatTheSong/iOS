//
//  CategoryView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/05.
//

import SwiftUI

struct CategoryView: View {
    let categories = ["발라드", "뮤지컬", "락", "댄스", "랩/힙합", "가요", "클래식", "POP", "인디", "OST", "트로트", "R&B", "JAZZ", "기악"]
    var stateOfCategory: StateOfCategory

    @Binding var categoryName: String?
    @Environment(\.presentationMode) var mode
//    @State var tag:String? = nil
    
    var body: some View {
        
        if stateOfCategory == .small {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1...(categories.count)/2, id: \.self) { index in
                        VStack {
                            CategoryCell(content: categories[2 * (index - 1)], stateOfCategroy: .small) // 짝수
                            CategoryCell(content: categories[(2 * index) - 1], stateOfCategroy: .small) // 홀수
                       }.padding(5)
                        
                    }
                }
            }
        }
        else if stateOfCategory == .large {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1...(categories.count)/2, id: \.self) { index in
                        HStack {
                            Button(action: {
//                                print("됨?")
//                                print(categories[2 * (index - 1)])
                                self.categoryName = categories[2 * (index - 1)]
                                self.mode.wrappedValue.dismiss()
                            }) {
                                CategoryCell(content: categories[2 * (index - 1)], stateOfCategroy: .large)
                                    .padding(.horizontal, 15)
                            }
                            Button(action: {
//                                print("되니?")
//                                print(categories[(2 * index) - 1])
                                self.categoryName = categories[(2 * index) - 1]
                                self.mode.wrappedValue.dismiss()
                            }) {
                                CategoryCell(content: categories[(2 * index) - 1], stateOfCategroy: .large)
                                    .padding(.horizontal, 15)
                            }
                        }
                        .padding([.top, .bottom], 10)
                        .foregroundColor(.black)
                    }
                }
            }
        }
        
    }
}


 

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(stateOfCategory: .large)
//    }
//}
