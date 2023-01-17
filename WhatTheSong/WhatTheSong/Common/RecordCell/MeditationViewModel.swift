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
    
    static let data = Meditation(title: "123123", description: "456456", duration: 240, track: "ShapeOfYou")
}
