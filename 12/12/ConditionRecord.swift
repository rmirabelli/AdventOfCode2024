//
//  ConditionRecord.swift
//  12
//
//  Created by Russell Mirabelli on 12/12/23.
//

//???.### 1,1,3
//.??..??...?##. 1,1,3


import Foundation

// one line is a condition record
struct ConditionRecord {
	// the possibilities are an array of integers that match
	// the required pattern
	let possibilities: [Int]
	// the matches is an array of integers that represent valid
	// groupings
	let matches: [Int]

	init(possibilities: [Int], matches: [Int]) {
		self.possibilities = possibilities
		self.matches = matches
	}

	init(_ s: String) {
		let parts = s.split(separator: " ")
		let pattern = parts[0]
		matches = parts[1].split(separator: ",").map {Int($0)!}
		let must = pattern.replacingOccurrences(of: ".", with: "0").replacingOccurrences(of: "#", with: "1").replacingOccurrences(of: "?", with: "0")
		let may = pattern.replacingOccurrences(of: ".", with: "0").replacingOccurrences(of: "#", with: "0")
			.replacingOccurrences(of: "?", with: "1")
		print(must)
		print(may)
		let mustNumber = Int32(must, radix: 2)!
		let mayNumber = Int32(may, radix: 2)!
		let choices = (0..<0xffffff).filter {(Int32($0) & mustNumber == mustNumber) && (Int32($0) & mayNumber != 0)}
		possibilities = choices
		// [2097151, 4194303, 131071, 4194303, 8191, 2097151]
	}
}
