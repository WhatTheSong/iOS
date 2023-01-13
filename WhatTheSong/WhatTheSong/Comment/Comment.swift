//
//  Comment.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/01/14.
//

import Foundation

struct Comment {
    let name: String
    let date: String
    let content: String
}

struct Dummy {
    static var comments: [Comment] = [Comment(name: "망고",
                                              date: "2021/02/10",
                                             content: "이게 뭐야"),
                                      Comment(name: "에반",
                                              date: "2022/09/12",
                                              content: "뭘까요"),
                                      Comment(name: "써머",
                                              date: "2021/03/16",
                                              content: "댓글입니다."),
                                      Comment(name: "노키",
                                              date: "2023/04/15",
                                              content: "안녕하세요"),
                                      Comment(name: "팍",
                                              date: "2021/05/13",
                                              content: "댓글더미"),
                                      Comment(name: "러코",
                                              date: "2022/06/13",
                                              content: "덤덤"),
                                      Comment(name: "오닝",
                                              date: "2023/08/15",
                                              content: "오니")
                                      ]
    
}

