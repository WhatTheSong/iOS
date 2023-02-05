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
                TitleView(title: "질문", tabbarItem: .Home)
                
                
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
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AudioManager())
    }
}
