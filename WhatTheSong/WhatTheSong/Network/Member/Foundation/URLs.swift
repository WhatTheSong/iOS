//
//  URLs.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation


public enum URLs {
    public static let baseURL = "https://whatthesong.store"
    public static let testURL = "https://test.whatthesong.store"
    
    // Account
    public static let tokenURL = "/app/users/token"
    public static let userURL = "/app/users/oauth"
    public static let editProfileURL = "/app/users/edit-profile"
    public static let editNotiURL = "/app/users/edit-notification"
    public static let deleteUserURL = "/app/users/"
    
    
    //TOKEN
    public static let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyMCwiaWF0IjoxNjc2Mzc2NTA2LCJleHAiOjE2NzYzNzgzMDYsInN1YiI6IkFDQ0VTU19UT0tFTiJ9.Zem-IPRDk_hYUJViLFMhWeGQ0JKdbZq44yBxFLI1_QA"
    public static let refreshToken = "REFRESH"
    
}

