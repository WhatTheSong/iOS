//
//  CommentURLs.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

public enum CommentURLs {
    public static let baseURL = "https://whatthesong.store"
    public static let testURL = "https://test.whatthesong.store"
    
    // Comment
    public static func getComments(postIdx: Int) -> String {
        
        return ""
    }
    public static func postComment(postIdx: Int) -> String {
        
        return ""
    }
    public static func patchComment(postIdx: Int, idx: Int) -> String {
        
        return ""
    }
    public static func deleteComment(postIdx: Int, idx: Int) -> String {
        
        return ""
    }
    
    // Recomment
    public static func getRecomments(postIdx: Int, parentIdx: Int) -> String {
        
        return ""
    }
    public static func postRecomment(postIdx: Int, parentIdx: Int) -> String {
        
        return ""
    }
    public static func patchRecomment(postIdx: Int, parentIdx: Int) -> String {
        
        return ""
    }
    public static func deleteRecomment(postIdx: Int, parentIdx: Int) -> String {
        
        return ""
    }
}
