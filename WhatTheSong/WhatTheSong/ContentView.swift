//
//  ContentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        RecordCell(meditationVM: MeditationViewModel(meditation: Meditation.data))
        KakaoSignInView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
