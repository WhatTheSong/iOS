//
//  Boards.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/25.
//

import Foundation

struct Boards: Codable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Data]
}

struct Data: Codable{
    let idx: Int
    let category: String
    let title: String
    let content: String
    let nickname: String
}

struct Storage: Codable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [StorageDatas]
}

struct StorageDatas: Codable{
    let url: String
    let idx: Int
    let boardIdx: Int
    let createdAt: String
    let updatedAt: String
    let status: String
    let fileType: String
}
