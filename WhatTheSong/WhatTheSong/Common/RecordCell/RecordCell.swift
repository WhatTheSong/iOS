//
//  RecordCell.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct RecordCell: View {
    @State var silderValue: Double = 0.0

    var body: some View {
        VStack(){
            HStack(){
                Image(systemName: "photo")
                
                Spacer()
                
                ExplainView()
            }
            .padding(20)
            
            HStack{
                // MARK: Play Button
                PlayButton(systemName: "play.fill", action: {})
                .padding(.trailing, 15)
                
                // MARK: Music Slider
                VStack(spacing: 5){
                    Slider(value: $silderValue, in: 0...60)
                        .accentColor(.black)
                    
                    HStack{
                        Text("0:00")
                        
                        Spacer()
                        
                        Text("3:00")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                    
                }
            }
        }
        //.border(Color.gray.opacity(1), width: 1)
        .padding(20)

    }
}

struct RecordCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordCell()
    }
}
