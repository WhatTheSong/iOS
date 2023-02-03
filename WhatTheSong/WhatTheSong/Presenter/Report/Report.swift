//
//  Report.swift
//  WhatTheSong
//
//  Created by PC on 2023/02/04.
//

import Foundation

struct Report{
    let number: Int
    let description: String
}

struct ReportData{
    static var data: [Report] = [Report(number: 1, description: "신고사유 1"),
                                 Report(number: 2, description: "신고사유 2"),
                                 Report(number: 3, description: "신고사유 3"),
                                 Report(number: 4, description: "신고사유 4"),
                                 Report(number: 5, description: "신고사유 5")]
}
