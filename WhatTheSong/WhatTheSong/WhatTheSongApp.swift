//
//  WhatTheSongApp.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/10.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

import Firebase
import FirebaseMessaging

// Firebase 초기화
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    func application(_ application: UIApplication,
                           didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

          
        // [START set_messaging_delegate]
        Messaging.messaging().delegate = self
        // [END set_messaging_delegate]

        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()
        // [END register_for_notifications]

        return true
    }
    
    // MARK: Firebase
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
          let firebaseToken = fcmToken ?? ""
          print("firebase token: \(firebaseToken)")
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert, .badge, .sound])
   }
      
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

@main
struct WhatTheSongApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "37f788afb12986662fe27e13c7d5d01d")
   }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
