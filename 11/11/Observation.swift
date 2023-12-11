//
//  Observation.swift
//  11
//
//  Created by Russell Mirabelli on 12/11/23.
//

import Foundation
import AOCKit

struct Observation {
	let galaxies: [Galaxy]

	init(galaxies: [Galaxy]) {
		self.galaxies = galaxies
	}

	init(_ d: [String]) {
		var expanded = d
		var expansionIndicies: [Int] = []
		var additionalInset = 0
		for line in d.enumerated() {
			if !line.element.contains("#") {
				expansionIndicies.append(line.offset + additionalInset)
				additionalInset += 1
			}
		}
		let emptyLine = String(repeating: ".", count: d.first!.count)
		for additional in expansionIndicies {
			expanded.insert(emptyLine, at: additional)
		}
		expansionIndicies = []
		additionalInset = 0
		for x in 0..<expanded.first!.count {
			let col = expanded.map { $0[expanded.first!.index(expanded.first!.startIndex, offsetBy: x)] }
			if !col.contains("#") {
				expansionIndicies.append(x + additionalInset)
				additionalInset += 1
			}
		}
		for additional in expansionIndicies {
			for line in expanded.enumerated() {
				var newLine = line.element
				newLine.insert(".", at: newLine.index(newLine.startIndex, offsetBy: additional))
				expanded[line.offset] = newLine
			}
		}
		// finally we can find our galaxies. Yeesh!
		var newGalaxies: [Galaxy] = []
		for y in expanded.enumerated() {
			for x in y.element.enumerated() {
				if x.element == "#" {
					newGalaxies.append(Galaxy(location: Point2D(x.offset,y.offset)))
				}
			}
		}
		self.init(galaxies: newGalaxies)
	}
}
