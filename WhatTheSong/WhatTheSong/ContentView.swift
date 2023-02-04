//
//  ContentView.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ReportView(title: "안녕", nickname: "승진")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
