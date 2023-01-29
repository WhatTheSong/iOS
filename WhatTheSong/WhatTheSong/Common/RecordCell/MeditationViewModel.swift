//
//  MeditationViewModel.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/16.
//

import Foundation

final class MeditationViewModel: ObservableObject{
    private(set) var meditation: Meditation
    
    init(meditation: Meditation){
        self.meditation = meditation
    }
}

struct Meditation{
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    
}

struct MeditationData{
    static var data: [Meditation] = [Meditation(title: "123123",
                                                description: "456456",
                                                duration: 240,
                                                track: "ShapeOfYou"),
                                     
                                     Meditation(title: "3333",
                                                description: "44444",
                                                duration: 100,
                                                track: "ShapeOfYou1"),
                                     Meditation(title: "9999",
                                                description: "9999",
                                                duration: 500,
                                                track: "ShapeOfYou2")
                                      ]
}
