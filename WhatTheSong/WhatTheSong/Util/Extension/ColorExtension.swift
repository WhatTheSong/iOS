//
//  ColorExtension.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/01/12.
//  자주 쓰는 색상 만들어 뒀습니다~!

import Foundation
import SwiftUI

extension Color {
    static let ourOrange = Color(hex: "FFB055")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}


