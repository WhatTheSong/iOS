//
//  StorageURLs.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/02/14.
//

import Foundation

public enum StorageURLs {
    public static let baseURL = "https://whatthesong.store/"
    public static let testURL = "https://test.whatthesong.store/"
    
    public static let fileCheckURL = "app/storages/:boardIdx" // get
    public static let recordingUploadURL = "app/storages/voice/1" //post
    public static let editRecordingFileURL = "app/storages/voice/1" // patch
    public static let imageUploadURL = "app/storages/image/0" // post
    public static let editImageFileURL = "app/storages/image/1" // patch
    
}
