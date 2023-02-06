//
//  AccountManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

import Alamofire

class AccountManager {
    func postAccount(account: AccountModel, platform: SignInPlatform) {
        var url: String
        switch platform {
        case .Apple:
            url = URLs.testURL + URLs.appleUserURL
        case .Kakao:
            url = URLs.testURL + URLs.kakaoUserURL
        }
        
        APIManager.request(url: url, params: ParameterManager.makeKakaoAccountParameter(account: account))
        
    }
}

