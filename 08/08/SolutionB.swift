//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionB: SolutionProtocol {
	var name = "b"
	func execute(_ data: [String]) -> String {
		let map = GhostMap(data)
		let nodes = map.findNodes(endingIn: "A")
		let times = nodes.map { source in
			map.stepsToEnd(source.name, "Z")
		}
		let reduced = times.reduce(1) { findLCM(n1: $0, n2: $1) }
		return "\(reduced)"
	}


    func executeBruteForce(_ data: [String]) -> String {
		let map = GhostMap(data)
		var nodes = map.findNodes(endingIn: "A")
		var count = 0
		repeat {
			nodes = nodes.map { map.runCommand(index: count, from: $0) }
			count += 1
		} while !(nodes.filter { $0.name.last! != "Z" }.isEmpty)
        return "\(count)"
    }
}
