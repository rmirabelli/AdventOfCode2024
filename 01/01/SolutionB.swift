//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
import Algorithms

let table = [
	("twone", "21"),
	("threeight", "38"),
	("eightwo", "82"),
	("eighthree", "83"),
	("nineight", "98"),
	("sevenine", "79"),
	("oneight", "18"),
	("one", "1"),
	("two", "2"),
	("three", "3"),
	("four", "4"),
	("five", "5"),
	("six", "6"),
	("seven", "7"),
	("eight", "8"),
	("nine", "9"),
]

// this is insanely gross
extension String {
	func replaceWords() -> String {
		var new = self
		for element in table {
			new = new.replacingOccurrences(of: element.0, with: element.1)
		}
		return new
	}
}

struct SolutionB: SolutionProtocol {
    var name = "Day 1 part 2"
    func execute(_ data: [String]) -> String {
		var usable = data
		if usable.last!.isEmpty {
			usable.removeLast()
		}
		let substituted = usable.map { $0.replaceWords() }
		let numbersOnly = substituted.map {$0.filter{$0.isNumber}}
		let firstAndLast = numbersOnly.map{"\($0.first!)\($0.last!)"}
		let integers = firstAndLast.map{Int($0)!}
		let sum = integers.reduce(0) {$0 + $1}
		return  "\(sum)"
    }
}
