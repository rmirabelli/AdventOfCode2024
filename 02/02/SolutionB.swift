//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionB: SolutionProtocol {
    var name = "Solution B"
    func execute(_ data: [String]) -> String {
			//		Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
		let scores = data.map { entry in
			let preamble = entry.split(separator: ":").first!
			let plays = String(entry.split(separator: ":").last!)
			let turns = plays.split(separator: ";")
			let powers = turns.map {
				let chunks = $0.split(separator: ",")
				var bluePower = 1
				var redPower = 1
				var greenPower = 1
				for chunk in chunks {
					let splits = chunk.split(separator: " ")
					let color = splits.last!
					let count = Int(splits.first!)!
					if color == "red" { redPower = max(redPower, count) }
					if color == "green" { greenPower = max(greenPower, count) }
					if color == "blue" { bluePower = max(bluePower, count) }
				}
				return (bluePower, redPower, greenPower)
			}
			return powers.reduce((1,1,1)) { partialResult, values in
				return (max(partialResult.0, values.0), max(partialResult.1,values.1), max(partialResult.2, values.2))
			}
		}
		let sum = scores.reduce(0) {$0 + $1.0 * $1.1 * $1.2}
		return "\(sum)"    }
}
