//
//  Oasis.swift
//  09
//
//  Created by Russell Mirabelli on 12/9/23.
//

import Foundation
import Algorithms

struct History {
	let data: [Int]

	init(data: [Int]) {
		self.data = data
	}

	// create an array of integers from a string
	init(_ s: String) {
		let components = s.components(separatedBy: " ")
		self.init(data: components.map { Int($0)! })
	}
}

struct Oasis {
	let history: [History]

	init(history: [History]) {
		self.history = history
	}

	// build from a set of number lists
	init(_ s: [String]) {
		self.init(history: s.map { History($0) })
	}

	// predict the next level for a single sequence of numbers
	private func predictionLevel(_ sequence: [Int]) -> Int {
		// start by making a new sequence from the difference at each step of your history
		var difference = sequence.adjacentPairs().map { $0.1 - $0.0 }
		// If that sequence is not all zeroes, repeat this process, using the sequence you just generated as the input sequence
		if difference.reduce(0, { $0 + $1 }) != 0 {
			let value = predictionLevel(difference)
			difference.append(value)
		}
		return sequence.last! + difference.last!
	}

	// get a sum of the predicted last values of all lines
	func prediction() -> Int {
		return history.reduce(0) { partialResult, h in
			partialResult + predictionLevel(h.data)
		}
	}

	// get a sum of the predicted *previous* values of all lines
	func extrapolate() -> Int {
		return history.reduce(0) { partialResult, h in
			partialResult + predictionLevel(h.data.reversed())
		}
	}
}
