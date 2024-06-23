//
//  AdventureStep.swift
//  CPSC5330 Assignment 5
//
//  Created by Christian Polka on 6/23/24.
//

import Foundation

enum AdventureResult {
    case success, failure
}

struct AdventureStep {
    let description: String
    let options: [String]
    let outcomes: [Int]
}
