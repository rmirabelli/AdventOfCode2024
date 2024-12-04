//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import Algorithms
import AOCKit
//only 12 red cubes, 13 green cubes, and 14 blue cubes
struct SolutionA: SolutionProtocol {
    var name = "Solution A"
    func execute(_ data: [String]) -> String {
		let integerReports = data.map {
			let elements = $0.split(separator: " ")
			return elements.map { Int($0)! }
		}
		let ascendingDescending = integerReports.filter {
			let sorted = $0.sorted()
			let reversed = sorted.reversed()
			return $0 == sorted || $0 == Array(reversed)
		}
		let betweenOneAndThree = ascendingDescending.filter {
			let adjacent = $0.adjacentPairs()
//			print(Array(adjacent))
			let distances = adjacent.map { abs($0.0 - $0.1) }
//			print(Array(distances))
			let betweenOneAndThree = distances.filter { $0 >= 1 && $0 <= 3 }
			return betweenOneAndThree.count == distances.count
		}
		return "\(betweenOneAndThree.count)"
    }
}
