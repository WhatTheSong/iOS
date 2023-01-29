//
//  HomeView.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/18.
//

import SwiftUI

struct HomeView: View {
    
    @State var frame: CGSize = .zero
    
    var body: some View {
        VStack(){
            Spacer()
                .frame(height: 30)
            
            HStack{
                Text("아 그 노래 뭐더라")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: UIScreen.screenWidth-130, height: 40, alignment: .leading)
                
                
                Button(action: {
                    // action
                }) {
                    Image(systemName: "pencil")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            
            
            Divider()
                .frame(width: UIScreen.screenWidth-80, height: 3)
                .background(Color.ourOrange)
            
            Spacer()
                .frame(height: 20)
            // MARK: 테이블 뷰
            List(){
                ForEach(MeditationData.data.indices) { index in
                    
                    let _ = print("index : ", index)
                    VStack(alignment: .leading){
                        RecordCell(meditationVM: MeditationViewModel(meditation: MeditationData.data[index]))
                    }
                    //CommentCell(comment: Dummy.comments[index])
                }
            }
            
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
        }
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)
        
        DispatchQueue.main.async { self.frame = geometry.size }
        
        return Text("Test")
            .frame(width: geometry.size.width)
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
