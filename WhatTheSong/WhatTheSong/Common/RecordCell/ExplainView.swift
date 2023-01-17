//
//  ExplainView.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct ExplainView: View {
    var body: some View {
        Text("바꿔보자 깃허브에 제발 올라가줘......")
            .frame(width: 200, height: 80)
            .padding()
            .border(Color.gray.opacity(0.1), width: 1)
            .shadow(radius: 5)
    }
}

struct ExplainView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainView()
    }
}
