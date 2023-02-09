//
//  RecordCell.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct RecordCell: View {
    @StateObject var audioManager = AudioManager()
    let meditation: Meditation
    var isPreview : Bool = false
    @State private var isEditing: Bool = false
    @State private var silderValue: Double = 0.0
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        let player = audioManager.player
        VStack(){
            HStack(){
                Image("vynil")
                    .resizable()
                    .frame(width: 80,height: 80)
                
                Spacer()
                    .frame(width: 15)
                
                ExplainView(content: "가나다라마바사아자차카타파하")
            }
            .padding(15)
            
            HStack{
                // MARK: Play Button
                PlayButton(systemName: player?.isPlaying ?? false ? "pause.circle" : "play.fill", action: {
                    if ((player?.isPlaying) != nil) {
                        audioManager.playPause()
                    } else {
                        audioManager.startPlayer(track: meditation.track, isPreview: isPreview)
                    }
                })
                .padding(.trailing, 15)
                
                // MARK: Music Slider
                VStack(spacing: 5){
                    Slider(value: $silderValue, in: 0...(player?.duration ?? 0.0)){ editing in
                        
                        print("editing", editing)
                        isEditing = editing
                        
                        if !editing {
                            player?.currentTime = silderValue
                        }
                    }
                    .accentColor(.black)
                    
                    HStack{
                        Text(DateComponentsFormatter.positional.string(from: player?.currentTime ?? 0.0) ?? "0:00")
                        
                        Spacer()
                        
                        Text((DateComponentsFormatter.positional.string(from: meditation.duration - (player?.currentTime ?? 0.0)) ?? ""))
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
        }
        .padding(5)
        .onReceive(timer) { _ in
            
            guard let player = audioManager.player, !isEditing else { return }
            silderValue = player.currentTime
        }
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.ourOrange, lineWidth: 2))
        
    }
    
}

struct RecordCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordCell(meditation: MeditationData.data[0])
    }
}
