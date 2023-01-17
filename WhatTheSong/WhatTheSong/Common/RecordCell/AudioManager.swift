//
//  AudioManager.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/15.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject{
    //static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    func startPlayer(track: String, isPreview: Bool = false){
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        
        do {
            // playback : 오디오가 무음 스위치를 무시하고 재생 가능하게 하기
            // default : 오디오만 포함되며 녹화, 비디오 또는 채팅은 포함되지 않음
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview{
                player?.prepareToPlay()
            }else{
                player?.play()
            }

        } catch {
            print("Fail to initialize player", error)
        }
        
    }
    
    func playPause(){
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        
        if player.isPlaying{
            player.pause()
        }else{
            player.play()
        }
    }
}
