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
    
    var audioRecorder: AVAudioRecorder!
    
    @Published var isRecording: Bool = false
    
    @Published var recordingList = [Recording]()
    @Published var countSec = 0
    @Published var timerCount: Timer?
    @Published var timer: String = "0:00"
    @Published var toggleColor: Bool = false
    @Published var blinkingCount: Timer?
    
    override init() {
        super.init()
        fetchRecording()
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
            
            timerCount = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (value) in
                self.countSec += 1
                self.timer = self.covertSecToMinAndHour(seconds: self.countSec)
            })
            blinkColor()
            
        } catch {
            print("녹음을 시작할 수 없습니다.")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        isRecording = false
        
        fetchRecording()
        
        self.countSec = 0
        
        timerCount!.invalidate()
        blinkingCount!.invalidate()
    }
    
    func fetchRecording() {
        recordingList.removeAll()
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
        
        for audio in directoryContents {
            recordingList.append(Recording(fileURL : audio, createdAt: getFileDate(for: audio)))
        }
        
        recordingList.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
    }
    
    
//    func deleteRecording(url: URL) {
//        do {
//            try FileManager.default.removeItem(at : url)
//        } catch {
//            print("Can't delete")
//        }
//
//        for i in 0..<recordingList.count {
//            if recordingList[i].fileURL == url {
//                if recordingList[i].isPlaying == true {
//                    stopPlaying(url: recordingList[i].fileURL)
//                }
//                recordingList.remove(at : i)
//                break
//            }
//        }
//    }
    
    // file 날짜 추출
    func getFileDate(for file: URL) -> Date {
        if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
            let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
            return creationDate
        } else {
            return Date()
        }
    }
    
    // 시간 단위 변환
    func covertSecToMinAndHour(seconds : Int) -> String{
        
        let (_,m,s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        let sec : String = s < 10 ? "0\(s)" : "\(s)"
        return "\(m):\(sec)"
        
    }
    
    func blinkColor() {
        
        blinkingCount = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { (value) in
            self.toggleColor.toggle()
        })
        
    }
}
