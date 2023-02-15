//
//  APIManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/01.
//

import Foundation

import Alamofire

class APIManager {
    /// purpose: Account
    /// method: Post
    static func request(url: String, params: Dictionary<String, Any>) {
        let url = URL(string: url)!
 
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: ["Content-Type" : "application/json"])
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
    /// purpose: Token
    /// method: Post
    static func request(url: String, headers: HTTPHeaders) {
        let url = URL(string: url)!
        
        AF.request(url, method: .post, headers: headers)
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
    /// purpose: Edit
    /// method: Patch
    static func request(url: String, params: Dictionary<String, Any>, headers: HTTPHeaders) {
        let url = URL(string: url)!
        
        AF.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers)
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
    
    ///  purpose: User Delete
    ///  method:Delete
    static func request(url: String) {
        AF.request(url, method: .delete)
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
