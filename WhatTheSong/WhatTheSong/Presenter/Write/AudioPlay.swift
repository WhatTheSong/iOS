//
//  AudioPlay.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/01/29.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlay: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    let objectWillChange = PassthroughSubject<AudioPlay, Never>()
    
    var isPlaying = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var audioPlayer: AVAudioPlayer!
    
    func startPlaying(url : URL) {
      
        let playSession = AVAudioSession.sharedInstance()
            
        do {
            try playSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing failed in Device")
        }
            
        do {
            audioPlayer = try AVAudioPlayer(contentsOf : url)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            isPlaying = true
                
//            for i in 0..<recordingList.count{
//                if recordingList[i].fileURL == url{
//                    recordingList[i].isPlaying = true
//                }
//            }
                
        } catch {
            print("Playing Failed")
        }
                
    }

    func stopPlaying(url : URL){
      
        audioPlayer.stop()
        isPlaying = false
      
//        for i in 0..<recordingList.count {
//            if recordingList[i].fileURL == url {
//                recordingList[i].isPlaying = false
//            }
//        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }
}
