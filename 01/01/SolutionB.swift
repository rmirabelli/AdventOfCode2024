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
    var name = "Day 1 part 2"
    func execute(_ data: [String]) -> String {
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
		// build a dictionary of counts for list b
		var counts: [Int: Int] = [:]
		for element in listB {
			counts[element, default: 0] += 1
		}
		var sum = 0
		for element in listA {
			guard let count = counts[element] else { continue; }
			sum += count * element
		}
		return "\(sum)"
    }
}
