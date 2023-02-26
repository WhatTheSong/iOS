//
//  RecommentManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

import Alamofire

class RecommentManager: RecommentManagerProtocol {
    let baseURL = URLs.testURL
    
    func showRecomments(postIdx: Int, parentIdx: Int) {
        let url: String = baseURL + CommentURLs.getRecomments(postIdx: postIdx, parentIdx: parentIdx)
        
        CommentAPIManager.request(url: url)
    }
    
    func writeRecomment(accessToken: String, postIdx: Int, parentIdx: Int, content: String) {
        let url: String = baseURL + CommentURLs.postRecomment(postIdx: postIdx, parentIdx: parentIdx)
        let param = CommentParameterManager.commentContentParameter(content: content)
        let header: HTTPHeader = HTTPHeader(name: "x-access-token", value: accessToken)
        
        CommentAPIManager.request(url: url, params: param, headers: [header], method: .post)
    }
    
    func editRecomment(accessToken: String, postIdx: Int, parentIdx: Int, idx: Int, content: String) {
        let url: String = baseURL + CommentURLs.patchRecomment(postIdx: postIdx, parentIdx: parentIdx)
        let param = CommentParameterManager.commentContentParameter(content: content)
        let header: HTTPHeader = HTTPHeader(name: "x-access-token", value: accessToken)
        
        CommentAPIManager.request(url: url, params: param, headers: [header], method: .patch)
    }
    
    func deleteRecomment(accessToken: String, postIdx: Int, parentIdx: Int, idx: Int) {
        let url: String = baseURL + CommentURLs.deleteRecomment(postIdx: postIdx, parentIdx: parentIdx)
        let header: HTTPHeader = HTTPHeader(name: "x-access-token", value: accessToken)
        
        CommentAPIManager.request(url: url, headers: [header])
    }
}
