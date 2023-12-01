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
		var usable = data
		if usable.last!.isEmpty {
			usable.removeLast()
		}
		// get the first digit and the last digit.
		let numbersOnly = usable.map {$0.filter{$0.isNumber}}
		let firstAndLast = numbersOnly.map{"\($0.first!)\($0.last!)"}
		let integers = firstAndLast.map{Int($0)!}
		let sum = integers.reduce(0) {$0 + $1}
       return  "\(sum)"
    }
}
