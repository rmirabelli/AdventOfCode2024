//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

class SolutionA: DayThreeSolution, SolutionProtocol {
	// the name of the solution
	var name = "Solution A"

    func execute(_ data: [String]) -> String {
		buildMapFromData(data)
		let numericEntities = entities.filter {$0.kind == .number}
		let symbolEntities = entities.filter {$0.kind == .symbol}
		let numericEntitesNearSymbols = numericEntities.filter { entity in
			let nearbySymbols = symbolEntities.filter { symbol in
				symbol.isNear(entity)
			}
			return !nearbySymbols.isEmpty
		}
		let sum = numericEntitesNearSymbols.reduce(0) {$0 + $1.value}
		return "\(sum)"
    }
}
