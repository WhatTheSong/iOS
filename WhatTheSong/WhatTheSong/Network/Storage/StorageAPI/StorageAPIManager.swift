//
//  StorageAPIManager.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/02/14.
//

import Foundation

import Alamofire
import UIKit

class StorageAPIManager {
    
    
    func postImage(imgData: UIImage?, imageName: String) {
        let url = StorageURLs.testURL + StorageURLs.imageUploadURL
        let header: HTTPHeaders = [
            "Content-Type" : "multipart/form-data"
        ]
        
        
        AF.upload(multipartFormData: { multipartFormData in
            if let image = imgData?.jpegData(compressionQuality: 1) {
                multipartFormData.append(image, withName: "uploadFiles", fileName: "\(imageName)", mimeType: "image/jpeg")
                print("이미지 파일이 있는데 왜 없대? \(image)")
            }
        }, to: url, method: .patch, headers: header)
        .responseString { (response) in
            print(response.description)
            switch response.result {
            case .success:
                print(response.description)
                print("이미지 포스트 성공!")
            case .failure(let error):
                print("error : \(error.errorDescription)")
            }
        }
        
    }
    
    func postRecording(recordingURL: URL, recordingName: String) {
        let url = StorageURLs.testURL + StorageURLs.recordingUploadURL
        
        AF.upload(multipartFormData: { multipartFormData in
            if let recordingData = try? Data(contentsOf: recordingURL) {
                multipartFormData.append(recordingData, withName: "uploadFiles", fileName: "\(recordingName)", mimeType: "audio/m4a")
                print("레코딩 파일 있는지 확인~~ \(recordingData)")
            }
            
        }, to: url, method: .post)
        .responseString { (response) in
            switch response.result {
            case .success:
                print(response.description)
                print("레코딩 포스트 성공!")
            case .failure(let error):
                print("error : \(error.errorDescription)")
            }
        }
    }
}
