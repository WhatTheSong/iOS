//
//  HomeView.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/18.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack(){
                
                Spacer()
                
                Divider()
                    .frame(width: UIScreen.screenWidth-30, height: 3)
                    .background(Color.ourOrange)
                
                Spacer()
                    .frame(height: 20)
                
                // MARK: 테이블 뷰
                List(){
                    ForEach(MeditationData.data.indices) { index in
                        VStack(alignment: .leading){
                            RecordCell(meditation : MeditationData.data[index])
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("왓쏭 - What Song")
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AudioManager())
    }
}


// MARK: 아이폰 화면 길이 위한 extension
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
