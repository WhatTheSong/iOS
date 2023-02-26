//
//  BoardManager.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/25.
//

import Foundation
import Alamofire

class BoardManager {
    let baseURL = BoardURLs.testURL

    func getBoardContents(){
        let url: String
        url = baseURL + BoardURLs.getContents
        
        BoardAPIManager.request(url: url)
        BoardAPIManager.fileRequest()
    }
}
