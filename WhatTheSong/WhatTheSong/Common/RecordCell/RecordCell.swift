//
//  RecordCell.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/11.
//

import SwiftUI

struct RecordCell: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview : Bool = false
    @State private var isEditing: Bool = false
    @State private var silderValue: Double = 0.0
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack(){
            HStack(){
                Image("vynil")
                    .resizable()
                    .frame(width: 100,height: 100)
                
                Spacer()
                    .frame(width: 20)
                
                ExplainView()
            }
            .padding(20)
            
            HStack{
                let player = audioManager.player
                
                // MARK: Play Button
                PlayButton(systemName: player?.isPlaying ?? false ? "pause.circle" : "play.fill", action: {
                    if ((player?.isPlaying) != nil) {
                        audioManager.playPause()
                    } else {
                        audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
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
                        
                        Text((DateComponentsFormatter.positional.string(from: meditationVM.meditation.duration - (player?.currentTime ?? 0.0)) ?? ""))
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
        }
        //.border(Color.gray.opacity(1), width: 1)
        .padding(20)
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            silderValue = player.currentTime
        }
        
    }
}

struct RecordCell_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    
    static var previews: some View {
        RecordCell(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}
