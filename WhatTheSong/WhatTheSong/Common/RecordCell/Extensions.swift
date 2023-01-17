//
//  Extensions.swift
//  WhatTheSong
//
//  Created by PC on 2023/01/16.
//

import Foundation

extension DateComponentsFormatter{
    static let positional: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.positional")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
