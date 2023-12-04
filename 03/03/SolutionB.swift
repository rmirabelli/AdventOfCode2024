//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

class SolutionB: DayThreeSolution, SolutionProtocol {
	// the name of the solution
	var name = "Solution B"

	// A structure to hold a composed gear
	struct Gear {
		let gearEntity: SchematicEntity
		let nearbyNumbers: [SchematicEntity]
		var power: Int {
			if nearbyNumbers.count != 2 { return 0 }
			return nearbyNumbers.reduce(1) { $0 * $1.value }
		}
	}

	func execute(_ data: [String]) -> String {
		buildMapFromData(data)
		let numericEntities = entities.filter {$0.kind == .number}
		let gears = entities.filter {$0.kind == .gear}
		let gearStructs = gears.map { g in
			Gear(gearEntity: g, nearbyNumbers: numericEntities.filter( { e in
				e.isNear(g)
			}))}
		let powerSum = gearStructs.reduce(0) { $0 + $1.power }
		return "\(powerSum)"
    }
}
