//
//  AccountManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

import Alamofire

class AccountManager {
    func postAccount(account: AccountModel) {
        var url: String
        url = URLs.testURL + URLs.userURL

        APIManager.request(url: url, params: ParameterManager.makeKakaoAccountParameter(account: account))
    }
}

