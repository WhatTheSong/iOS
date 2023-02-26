//
//  CommentAPIManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

import Alamofire

class CommentAPIManager {
    /// purpose: Read
    /// method: Get
    static func request(url: String) {
        let url = URL(string: url)!
        
        AF.request(url, method: .get)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    print(response.description)
                    print("POST 성공1")
                case .failure(let error):
                    print("error : \(error.errorDescription!)")
                }
            }
    }
    
    /// purpose: Delete
    /// method: Delete
    static func request(url: String, headers: HTTPHeaders ) {
        let url = URL(string: url)!
        
        AF.request(url, method: .delete, headers: headers)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    print(response.description)
                    print("POST 성공1")
                case .failure(let error):
                    print("error : \(error.errorDescription!)")
                }
            }
    }
    
    /// purpose: Update, Create
    /// method: Patch, Post
    static func request(url: String, params: Dictionary<String, Any>, headers: HTTPHeaders, method: HTTPMethod) {
        let url = URL(string: url)!
        
        AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseString { response in
                switch response.result {
                case .success:
                    print(response.description)
                    print("POST 성공1")
                case .failure(let error):
                    print("error : \(error.errorDescription!)")
                }
            }
    }
    
}
