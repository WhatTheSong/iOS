//
//  ReportSendView.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import SwiftUI
import Foundation

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                
                configuration.label
            }
        })
    }
}

struct ReportSendView: View {
    @Binding var selection: String?
    @Binding var title: String
    
    @State private var isOn: Bool = false
  
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("'\(title)'")
                        Text("게시글을 \(selection!)에 따라 신고합니다")
                            .bold()
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack{
                            Toggle(isOn: $isOn) {
                                Text("이 사용자의 글 보지 않기")
                                    .bold()
                                    .tint(.black)
                            }
                            .toggleStyle(iOSCheckboxToggleStyle())
                        }
                        
                        Spacer()
                    }
                    .offset(x: 30, y: 50)
                    
                    Spacer()
                    
                }//Hstack
                
                Button(action: {
                    
                }) {
                    Text("왓송에게 보내기")
                        .bold()
                        .padding()
                }
                .frame(width: 150, height: 40)
                .background(Color.ourOrange)
                .tint(.black)
                .cornerRadius(25)
                .offset(y: -200)
                
            }//Vstack
        }//Zstack
    }
}

struct ReportSendView_Previews: PreviewProvider {
    static var previews: some View {
        ReportSendView(selection: .constant(""), title: .constant(""))
    }
}
