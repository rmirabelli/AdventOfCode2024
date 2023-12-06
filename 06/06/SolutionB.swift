//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionB: SolutionProtocol {
	var name = "Solution A"
    func execute(_ data: [String]) -> String {
		let race = RaceInfo.singleRace(data)
		let possibleValues = (0..<race.time).map { $0 * (race.time - $0) }
		let winning = possibleValues.filter { $0 > race.distance }
		return("\(winning.count)")
    }
}
