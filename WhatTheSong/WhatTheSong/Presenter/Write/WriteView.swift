//
//  WriteView.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/01/13.
//

import SwiftUI

struct WriteView: View {
    @ObservedObject var audioRecording = AudioRecord()
    @ObservedObject var audioPlaying = AudioPlay()
    
    @State private var contents = ""
    @State private var placeholderText = "찾고 싶은 노래에 대해 설명 해주세요!"
    
    var body: some View {
        VStack {
            Image("vynil")
                .padding(.bottom)
            Text(audioRecording.timer)
                .padding(.bottom)
            HStack {
                Button(action: {
                    if audioPlaying.isPlaying == true {
                        audioPlaying.stopPlaying(url: audioRecording.recordingList.last!.fileURL)
                        
                    }else{
                        audioPlaying.startPlaying(url: audioRecording.recordingList.last!.fileURL)
                        let _ = print("헌 녹음 \(audioRecording.recordingList.last!.fileURL.lastPathComponent)")
                    }
                }) {
                    Image(systemName: audioPlaying.isPlaying ? "stop.fill" : "play.fill")
                }
                .padding(.trailing)
                Button(action: {}) {
                    Image(systemName: audioRecording.isRecording ? "stop.circle.fill" : "record.circle")
                        .onTapGesture {
                            if audioRecording.isRecording == true {
                                audioRecording.stopRecording()
                                print("stop")
                            } else {
                                audioRecording.startRecording()
                                print("start")
                                
                            }
                        }
                }
                .padding(.leading)
            }
            .padding(.bottom)
            ZStack {
                if self.contents.isEmpty {
                    TextEditor(text: $placeholderText)
                        .padding(.all, 1.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        .foregroundColor(.gray)
                        .disabled(true)
                }
                TextEditor(text: $contents)
                    .padding(.all, 1.0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.ourOrange, lineWidth: 1))
                    .opacity(self.contents.isEmpty ? 0.7 : 1)
            }
            .padding(.horizontal, 50)
                
        }
        
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(audioRecording: AudioRecord())
    }
}
