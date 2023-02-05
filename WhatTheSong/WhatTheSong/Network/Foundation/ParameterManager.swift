//
//  ParameterManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

class ParameterManager {
    static func makeAccountParameter(account: AccountModel) -> Dictionary<String, Any> {

        let params = ["oauthId": account.oauthId,
                      "nickname": account.nickname,
                      "email": account.email] as Dictionary
        
        return params
    }
}
