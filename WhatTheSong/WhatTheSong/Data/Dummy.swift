//
//  Dummy.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/18.
//

import Foundation

struct Dummy {
    static var recommendBoards: [RecommendBoard] = [
        RecommendBoard(title: "눈의 꽃",
                       description: "박효신 명곡입니다!",
                       imageName: "phs",
                       category: .Balad),
        RecommendBoard(title: "가을 밤 떠난 너",
                       description: "씁쓸한 가을 밤이 생각나는 케이시의 곡이죠.",
                       imageName: "kc",
                       category: .Balad),
        RecommendBoard(title: "지크슈 겟세마네",
                       description: "마이클 리의 소름돋는 노래!",
                       imageName: "Superstar",
                       category: .Musical),
        RecommendBoard(title: "오페라의 유령",
                       description: "이거 모르는 분 없죠?",
                       imageName: "Opera",
                       category: .Musical),
        RecommendBoard(title: "천년의 사랑",
                       description: "남자라면 노래방에서 한번쯤..",
                       imageName: "pwg",
                       category: .Rock),
        RecommendBoard(title: "금지된 사랑",
                       description: "김경호의 시원한 락 노래입니다.",
                       imageName: "kkh",
                       category: .Rock)
    ]
    
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
    
    static var reComments: [Comment] = [Comment(name: "익명1이름이길면?",
                                                date: "2022/11/22",
                                                content: "스트레이의 달이요"),
                                        Comment(name: "익명2",
                                                date: "2023/01/08",
                                                content: "뉴진스의 하이프보이요")]
    
}


struct MeditationData{
    static var data: [Meditation] = [Meditation(title: "123123",
                                                description: "팝송이었던 거 같아요..",
                                                duration: 240,
                                                track: "ShapeOfYou"),
                                     
                                     Meditation(title: "3333",
                                                description: "힙합? 느낌이였어요",
                                                duration: 100,
                                                track: "ShapeOfYou1"),
                                     Meditation(title: "9999",
                                                description: "밴드 노래인데 제목 기억이 안나요!",
                                                duration: 500,
                                                track: "ShapeOfYou2"),
                                     Meditation(title: "9999",
                                                description: "9999",
                                                duration: 500,
                                                track: "ShapeOfYou2")
                                      ]
}
