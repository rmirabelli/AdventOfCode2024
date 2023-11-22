//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import Algorithms
import AOCKit

struct SolutionA: SolutionProtocol {
    var name = "Solution A"
    func execute(_ data: [String]) -> String {
        data.first ?? "unable to read first element"
    }
}
