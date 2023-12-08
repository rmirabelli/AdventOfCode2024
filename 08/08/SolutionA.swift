//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
struct SolutionA: SolutionProtocol {
	var name = "a"
    func execute(_ data: [String]) -> String {
		let map = GhostMap(data)
		let count = map.steps("AAA", "ZZZ")
        return "Cycles: \(count)"
    }
}
