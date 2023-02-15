//
//  ParameterManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

class ParameterManager {
    // MARK: - Post
    static func makeAccountParameter(account: AccountModel) -> Dictionary<String, Any> {
        let params = ["oauthId": account.oauthId,
                      "nickname": account.nickname,
                      "email": account.email] as Dictionary
        
        return params
    }
    
    // MARK: - Patch
    static func makeEditProfileParameter(nickName: String) -> Dictionary<String, Any> {
        let params = ["nickname": nickName] as Dictionary
        
        return params
    }

    static func makeEditNotiParameter(isAllow: Int) -> Dictionary<String, Any> {
        let params = ["isAllow": isAllow] as Dictionary
        
        return params
    }
}
