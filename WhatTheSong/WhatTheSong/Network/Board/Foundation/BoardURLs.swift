//
//  BoardURLs.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/25.
//

import Foundation

public enum BoardURLs {
    public static let baseURL = "https://whatthesong.store"
    public static let testURL = "https://test.whatthesong.store"
    
    // URLs
    public static let getContents = "/app/boards/1/contents"
    public static let getDetailContents = "/app/boards/:boardType/contents/:boardIdx"
    public static let postContents = "/app/boards/:boardType/contents"
    public static let patchContents = "/app/boards/:boardType/contents/:boardIdx"
    public static let deleteContents = "/app/boards/contents/:boardIdx"
    
    
    public static let getStorage = "/app/storages/"
}
