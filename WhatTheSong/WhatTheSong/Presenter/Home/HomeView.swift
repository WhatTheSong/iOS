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
            VStack{
                TitleView(title: "왓쏭 - What Song", tabbarItem: .Home)
                
                // MARK: 테이블 뷰
                ScrollView{
                    Spacer()
                    
                    ForEach(MeditationData.data.indices) { index in
                        RecordCell(meditation : MeditationData.data[index], recordCellLocation: .Home)
                    }
                }
                .frame(width: UIScreen.screenWidth - 20)
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
