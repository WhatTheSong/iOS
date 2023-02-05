//
//  Account.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

struct AccountModel: Codable {
    let oauthId: Int
    let nickname: String
    let email: String
}
