//
//  SolutionA.swift
//  11
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
import Algorithms

struct SolutionA: SolutionProtocol {
	var name = "Day 11 part 1"
    func execute(_ data: [String]) -> String {
		let o = Observation(data)
		let pairs = o.galaxies.combinations(ofCount: 2)
		let distances = pairs.map { $0.first!.location.manhattanDistance($0.last!.location) }
		let totalDistance = distances.reduce(0) { $0 + $1 }
        return "The total distance is \(totalDistance)"
    }
}
