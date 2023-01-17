//
//  AudioRecord.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/01/17.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecord: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    
    let objectWillChange = PassthroughSubject<AudioRecord, Never>()
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    @Published var isRecording: Bool = false
    
    @Published var recordingList = [Recording]()
    
    override init() {
        super.init()
    }
    
    
    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MM-YY 'at' HH:mm:ss"
        dateformatter.string(from: Date())
        
        let audioFilename = path.appendingPathComponent("\(dateformatter.string(from: Date())).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            isRecording = true
            
        } catch {
            print("녹음을 시작할 수 없습니다.")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        isRecording = false
        
        fetchRecording()
    }
    
    func fetchRecording() {
        recordingList.removeAll()
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
        
        for audio in directoryContents {
            recordingList.append(Recording(fileURL : audio, isPlaying: false))
        }
        
//        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
    }
    
    func startPlaying(url : URL) {
      
        let playSession = AVAudioSession.sharedInstance()
            
        do {
            try playSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing failed in Device")
        }
            
        do {
            audioPlayer = try AVAudioPlayer(contentsOf : url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
                
            for i in 0..<recordingList.count{
                if recordingList[i].fileURL == url{
                    recordingList[i].isPlaying = true
                }
            }
                
        } catch {
            print("Playing Failed")
        }
                
    }

    func stopPlaying(url : URL){
      
        audioPlayer.stop()
      
        for i in 0..<recordingList.count {
            if recordingList[i].fileURL == url {
                recordingList[i].isPlaying = false
            }
        }
      
    }
    
    func deleteRecording(url: URL) {
        do {
            try FileManager.default.removeItem(at : url)
        } catch {
            print("Can't delete")
        }
        
        for i in 0..<recordingList.count {
            if recordingList[i].fileURL == url {
                if recordingList[i].isPlaying == true {
                    stopPlaying(url: recordingList[i].fileURL)
                }
                recordingList.remove(at : i)
                break
            }
        }
    }
}
