//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import RegexBuilder
import AOCKit
import Algorithms

struct SolutionA: SolutionProtocol {
    var name = "Day 1 part 1"
    func execute(_ data: [String]) -> String {
		// split each line into two components
		var listA: [Int] = []
		var listB: [Int] = []
		for line in data {
			let elements = line.split(separator: " ")
			listA.append(Int(String(elements[0]))!)
			listB.append(Int(String(elements[1]))!)
		}
		// sort each sublist
		listA.sort()
		listB.sort()
		// zip them together
		let zipped = zip(listA, listB)
		// map to distance
		let sums = zipped.map { abs($0.0 - $0.1) }
		// reduce to final sum
		let answer = sums.reduce(0, +)
		return "\(answer)"
    }
}
