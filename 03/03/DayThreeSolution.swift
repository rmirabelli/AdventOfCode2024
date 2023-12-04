//
//  DayThreeSolution.swift
//  03
//
//  Created by Russell Mirabelli on 12/3/23.
//

import Foundation
import AOCKit

class DayThreeSolution {

		// an entity in the map.
		// we store the value independently, because that makes the enum of number
		// simpler to write code for. Sometimes associated values can bloat your
		// code.
	struct SchematicEntity {
			// part b adds a gear, but that's cool.
		enum SchematicEntityKind {
			case empty, symbol, number, gear
		}

		let upperLeft: Point2D
		let lowerRight: Point2D
		let kind: SchematicEntityKind
		let value: Int

		func isNear(_ other: SchematicEntity) -> Bool {
			upperLeft.cartesianDistance(other.upperLeft) == 1 || lowerRight.cartesianDistance(other.lowerRight) == 1
		}
	}

		// some variables for processing
	var entities: [SchematicEntity] = []
	var numberUpperLeft: Point2D?
	var numberString: String?

		// build out a temporary numeric string
	func appendToExistingNumber(_ c: Character, _ location: Point2D) {
		if numberUpperLeft == nil {
			numberUpperLeft = location
		}
		if numberString == nil {
			numberString = ""
		}
		numberString?.append(c)
	}

		// we're done adding digits, so complete the number
	func completeExistingNumber(_ location: Point2D) {
			// easy out
		guard let ns = numberString else { return }
		guard let nul = numberUpperLeft else { return }
			// closing location is x-1 because we've gone past the end of the number
		let closingLocation = Point2D(x: location.x - 1, y: location.y)
			// we trust that we've only allowed digits in here.
		let value = Int(ns)!
			// create an entity and add it
		entities.append(SchematicEntity(upperLeft: nul,
										lowerRight: closingLocation,
										kind: .number,
										value: value))
			// now that we've added the entity, we can dispose of the temporary variables
		numberUpperLeft = nil
		numberString = nil
	}

		// insert a symbol
	func addSymbol(_ c: Character, _ location: Point2D) {
		entities.append(SchematicEntity(upperLeft: location, lowerRight: location, kind: .symbol, value: -1))
	}

		// insert a gear
	func addGear(location: Point2D) {
		entities.append(SchematicEntity(upperLeft: location, lowerRight: location, kind: .gear, value: 1))
	}

		// character-by-character buildout
	func parseOneCharacterIntoMap(c: Character, location: Point2D) {
		switch c {
			case ".":
				completeExistingNumber(location)
			case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
				appendToExistingNumber(c, location)
			case "*":
				addGear(location: location);
				fallthrough
			default:
				completeExistingNumber(location)
				addSymbol(c, location)
		}
	}

		// walk the characters and build out our map
	func buildMapFromData(_ data: [String]) {
		for line in data.enumerated() {
			let sLine = String(line.element)
			for c in sLine.enumerated() {
				parseOneCharacterIntoMap(c: c.element, location: Point2D(x: c.offset, y: line.offset))
			}
		}
	}
}

