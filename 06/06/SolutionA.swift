//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionA: SolutionProtocol {
	var name = "Solution A"
    func execute(_ data: [String]) -> String {
		let info = RaceInfo.races(data)
		let distances = info.map { race in
			let possibleValues = (0..<race.time).map { $0 * (race.time - $0) }
			let winning = possibleValues.filter { $0 > race.distance }
			return winning.count
		}
		let marginOfError = distances.reduce(1) {$0*$1}
		print(marginOfError)
        return data.first!
    }
}
