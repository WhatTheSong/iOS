//
//  ExplainView.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct ExplainView: View {
    let content: String
    
    var body: some View {
        Text("\(content)")
            .tint(.black)
            .frame(width: 200, height: 60)
            .padding()
            .border(Color.gray.opacity(0.1), width: 1)
            .shadow(radius: 5)
            .lineLimit(2)
    }
}

struct ExplainView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainView(content: "가나다라마바사아자차카타파하가나다라마바사아자차카타파하")
    }
}
