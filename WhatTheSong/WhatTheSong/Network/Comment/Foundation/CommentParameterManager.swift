//
//  CommentParameterManager.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/27.
//

import Foundation

class CommentParameterManager {
    static func commentContentParameter(content: String) -> Dictionary<String, Any> {
        let params = ["content": content] as Dictionary
        
        return params
    }
}
