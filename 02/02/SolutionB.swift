//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
import Algorithms

struct SolutionB: SolutionProtocol {
    var name = "Solution B"

	func lineIsSafe(_ report: [Int]) -> Bool {
		let isAscending = report == report.sorted()
		let isDescending = report == Array(report.sorted().reversed())
		if (!isAscending && !isDescending) {
			return false
		}
		let adjacent = report.adjacentPairs()
		let distances = adjacent.map { abs($0.0 - $0.1) }
		let betweenOneAndThree = distances.filter { $0 >= 1 && $0 <= 3 }
		return betweenOneAndThree.count == distances.count
	}

	func execute(_ data: [String]) -> String {
		let integerReports = data.map {
			let elements = $0.split(separator: " ")
			return elements.map { Int($0)! }
		}
		let safeReports = integerReports.filter {
			lineIsSafe($0)
		}
		let unsafeReports = integerReports.filter {
			!lineIsSafe($0)
		}
		let goodUnsafeReports = unsafeReports.filter {
			let combinations = $0.combinations(ofCount: $0.count-1)
			let goodCombinations = combinations.filter { lineIsSafe($0) }
			return goodCombinations.count > 0
		}
		return "\(safeReports.count + goodUnsafeReports.count)"
	}
}
