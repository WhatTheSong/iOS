//
//  AccountManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

import Alamofire

class AccountManager {
    
  
    let baseURL = URLs.testURL
    
    func postKakaoAccount(account: AccountModel) {
        var url: String
        url = baseURL + URLs.userURL + "/?oauthProvider=kakao"
        
        APIManager.request(url: url, params: ParameterManager.makeAccountParameter(account: account))
    }
    
    func postAppleAccount(account: AccountModel) {
        var url: String
        url = baseURL + URLs.userURL + "/?oauthProvider=apple"

        APIManager.request(url: url, params: ParameterManager.makeAccountParameter(account: account))
    }
    
    func postToken(accessToken: String, refreshToken: String) {
        let url: String
        url = baseURL + URLs.tokenURL
        
        APIManager.request(url: url, headers: ["x-access-token": accessToken, "x-refresh-token": refreshToken])
    }
    
    func editProfile(accessToken: String, nickName: String) {
        let url: String
        url = baseURL + URLs.editProfileURL
        
        APIManager.request(url: url, params: ParameterManager.makeEditProfileParameter(nickName: nickName), headers: ["x-access-token": accessToken])
    }
    
    func editNotification(accessToken: String, isAllow: Int) {
        let url: String
        url = baseURL + URLs.editNotiURL
        
        APIManager.request(url: url, params: ParameterManager.makeEditNotiParameter(isAllow: isAllow), headers: ["x-access-token": accessToken])
    }
    
    func deleteUser() {
        let url: String
        url = baseURL + URLs.deleteUserURL
        
        APIManager.request(url: url)
    }
}

