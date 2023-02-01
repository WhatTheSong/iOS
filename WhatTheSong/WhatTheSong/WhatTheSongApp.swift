//
//  WhatTheSongApp.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/10.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct WhatTheSongApp: App {
    @StateObject var audioManager = AudioManager()
    
    init() {
       // Kakao SDK 초기화
       KakaoSDK.initSDK(appKey: "37f788afb12986662fe27e13c7d5d01d")
   }
    
    var body: some Scene {
        WindowGroup {

            ContentView()
                .environmentObject(audioManager)
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }

        }
    }
}
