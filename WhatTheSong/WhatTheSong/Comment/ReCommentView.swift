//
//  ReCommentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import SwiftUI

struct ReCommentView: View {
    var index: Int?
    
    var body: some View {
        Text(String(index ?? 0))
    }
}

struct ReCommentView_Previews: PreviewProvider {
    static var previews: some View {
        ReCommentView(index: 0)
    }
}
