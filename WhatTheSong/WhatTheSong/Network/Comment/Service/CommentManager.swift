//
//  CommentManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

class CommentManager: CommentManagerProtocol {
    
    let baseURL = URLs.testURL

    func showComments(postIdx: Int) {
        let url: String = baseURL + CommentURLs.getComments(postIdx: postIdx)
        
        CommentAPIManager.request(url: url)
    }
    
    func writeComment(accessToken: String, postIdx: Int, content: String) {
        let url: String = baseURL + CommentURLs.postComment(postIdx: postIdx)
        let param = CommentParameterManager.commentContentParameter(content: content)
        
        CommentAPIManager.request(url: url, params: param, headers: ["x-access-token": accessToken], method: .post)
    }
    
    func editComment(accessToken: String, postIdx: Int, idx: Int, content: String) {
        let url: String = baseURL + CommentURLs.patchComment(postIdx: postIdx, idx: idx)
        let param = CommentParameterManager.commentContentParameter(content: content)
        
        CommentAPIManager.request(url: url, params: param, headers: ["x-access-token": accessToken], method: .patch)
    }
    
    func deleteComment(accessToken: String, postIdx: Int, idx: Int) {
        let url: String = baseURL + CommentURLs.deleteComment(postIdx: postIdx, idx: idx)
        
        CommentAPIManager.request(url: url, headers: ["x-access-token": accessToken])
    }
}
