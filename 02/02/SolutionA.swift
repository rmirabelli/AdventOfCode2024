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
//		Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
		let scores = data.map { entry in
			let preamble = entry.split(separator: ":").first!
			let plays = String(entry.split(separator: ":").last!)
			let round = Int(preamble.split(separator: " ").last!)!
			let turns = plays.split(separator: ";")
			let possible = turns.map {
				let chunks = $0.split(separator: ",")
				var blueCount = 0
				var redCount = 0
				var greenCount = 0
				for chunk in chunks {
					let splits = chunk.split(separator: " ")
					let color = splits.last!
					let count = Int(splits.first!)!
					if color == "red" { redCount += count }
					if color == "green" { greenCount += count }
					if color == "blue" { blueCount += count }
				}
				if blueCount > 14 || greenCount > 13 || redCount > 12 { return false }
				return true
			}
			if possible.contains(where: { val in
				val == false
			}) {
				return 0
			}
			return round
		}
		let sum = scores.reduce(0) {$0 + $1}
		return "\(sum)"
    }
}
