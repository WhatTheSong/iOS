//
//  PlayButton.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct PlayButton: View {
    
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .black
    var action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(action: {})
    }
}
