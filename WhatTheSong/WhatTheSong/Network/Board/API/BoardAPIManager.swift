//
//  APIManager.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/25.
//

import Foundation
import Alamofire

var boardIdx = 0

class BoardAPIManager {
    /// method: GET
    /// purpose: board_idx / content
    static func request(url: String){
        let url = URL(string:url)!
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: ["Content-Type":"application/json"])
        .validate(statusCode: 200..<500)
        .responseData { (response) in
            switch response.result {
            case .success(let data):
                
                do {
                    let boards = try JSONDecoder().decode(Boards.self, from: data)
                    print(boards.result[0].idx)
                    boardIdx = boards.result[0].idx
                }
                catch {print(error)}
                
            case .failure(let error):
                print (error)
            }
        }
    }
    
    /// method: GET
    /// purpose: get file
    static func fileRequest(){
        AF.request(BoardURLs.testURL+BoardURLs.getStorage+"\(boardIdx)",
                   method: .get,
                   parameters: nil,
                   headers: ["Content-Type":"application/json"])
        .validate(statusCode: 200..<500)
        .responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let storages = try JSONDecoder().decode(Storage.self, from: data)
                    print(storages)
                }
                catch {print(error)}
                
            case .failure(let error):
                print (error)
                
            }
        }
    }
    
    // 위의 메서드 2개 이용해서 MeditationData에 추가를 해야하는데...
}
