//
//  CommentProtocol.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

protocol CommentManagerProtocol {
    func showComments(postIdx: Int)
    func writeComment(accessToken: String, postIdx: Int, content: String)
    func editComment(accessToken: String, postIdx: Int, idx: Int,  content: String)
    func deleteComment(accessToken: String, postIdx: Int, idx: Int)
}

protocol RecommentManagerProtocol {
    func showRecomments(postIdx: Int, parentIdx: Int)
    func writeRecomment(accessToken: String, postIdx: Int, parentIdx: Int, content: String)
    func editRecomment(accessToken: String, postIdx: Int, parentIdx: Int, idx: Int,  content: String)
    func deleteRecomment(accessToken: String, postIdx: Int, parentIdx: Int, idx: Int)
}
