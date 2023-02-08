//
//  APIManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

import Alamofire

class APIManager {
    static func request(url: String, params: Dictionary<String, Any>) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.post.rawValue
    
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.timeoutInterval = 10
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("error : \(error.errorDescription!)")
            }
        }
    }
    
    func gett() {
        
    }
}
