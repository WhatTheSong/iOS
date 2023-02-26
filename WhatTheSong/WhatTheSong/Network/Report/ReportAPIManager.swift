//
//  ReportAPIManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

import Alamofire

class ReportAPIManager {
    
    func postReport(reportIdx: Int, accessToken: String, reportType: String, reportCode: Int){
        let url: String = baseURL + reportURL(reportIdx: reportIdx)
        let header: HTTPHeader = HTTPHeader(name: "x-access-token", value: accessToken)
        let param = makeParameter(reportType: reportType, reportCode: reportCode)
        
        request(url: url, params: param, headers: [header], method: .post)
    }
    
    //MARK: private
    private let baseURL = URLs.testURL
    
    private func reportURL(reportIdx: Int) -> String {
    
        return "/app/reports/\(reportIdx)"
    }
    
    private func request(url: String, params: Dictionary<String, Any>, headers: HTTPHeaders, method: HTTPMethod) {
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
           
    private func makeParameter(reportType: String, reportCode: Int) -> Dictionary<String, Any> {
        let params = ["reportType": reportType, "reportCode": reportCode] as Dictionary
        
        return params
    }
}
