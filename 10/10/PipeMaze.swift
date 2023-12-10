//
//  PipeMaxe.swift
//  10
//
//  Created by Russell Mirabelli on 12/10/23.
//

import Foundation
import AOCKit

class Pipe{

	enum Kind {
		case vertical
		case horizontal
		case northeast
		case northwest
		case southwest
		case southeast
		case start
		case none

		init(_ c: Character) {
			switch c {
				case "|": self = .vertical
				case "-": self = .horizontal
				case "L": self = .northeast
				case "J": self = .northwest
				case "7": self = .southwest
				case "F": self = .southeast
				case "S": self = .start
				case ".": self = .none
				default: fatalError()
			}
		}
	}
	let kind: Kind
	let location: Point2D
	var distanceFromStart: Int
	func nextPipeLocation(_ from: Point2D) -> Point2D {
		return switch self.kind {
			case .vertical: from.y < location.y ?
				Point2D(x: location.x, y: location.y + 1) :
				Point2D(x: location.x, y: location.y - 1)
			case .horizontal: from.x < location.x ?
				Point2D(x: location.x + 1, y: location.y) :
				Point2D(x: location.x - 1, y: location.y)
			case .northwest: from.x < location.x ?
				Point2D(location.x, location.y - 1) :
				Point2D(location.x - 1, location.y)
			case .northeast: from.x > location.x ?
				Point2D(location.x, location.y - 1) :
				Point2D(location.x + 1, location.y)
			case .southwest: from.x < location.x ?
				Point2D(location.x, location.y + 1) :
				Point2D(location.x - 1, location.y)
			case .southeast: from.x > location.x ?
				Point2D(location.x, location.y + 1) :
				Point2D(location.x + 1, location.y)
			case  .none: fatalError()
			default: fatalError()
		}
	}

	init(kind: Kind, location: Point2D, distanceFromStart: Int) {
		self.kind = kind
		self.location = location
		self.distanceFromStart = distanceFromStart
	}
	
	convenience init(_ c: Character, _ location: Point2D) {
		self.init(kind: Kind(c), location: location, distanceFromStart: 0)
	}
}

struct PipeMaze {
	let maze: [Pipe]

	var startingPoint: Pipe {
		maze.filter {$0.kind == .start}.first!
	}

	func connectingPoints(_ startingFrom: Pipe) -> (Pipe, Pipe) {
		let x = startingFrom.location.x
		let y = startingFrom.location.y
		let neighbors: [Pipe?] = [
			maze.first { $0.location == Point2D(x, y - 1) },
			maze.first { $0.location == Point2D(x - 1, y) },
			maze.first { $0.location == Point2D(x + 1, y) },
			maze.first { $0.location == Point2D(x, y + 1) }
		]
		let possibles: [[Pipe.Kind]] = [
			[.vertical, .northeast, .northwest],
			[.horizontal, .northeast, .southeast],
			[.horizontal, .northwest, .southwest],
			[.vertical, .southeast, .southwest]
		]
		let goodNeighbors = neighbors.enumerated().map {
			let testElement = $0.element ?? Pipe(kind: .none, location: Point2D(-1,-1), distanceFromStart: -1)
			return possibles[$0.offset].contains(testElement.kind) ? $0.element : nil
		}.filter { $0 != nil }
		guard goodNeighbors.count <= 2 else { fatalError() }
		return (goodNeighbors.first!!, goodNeighbors.last!!)
	}

	func loopLength() -> Int {
		var start = startingPoint.location
		var next = connectingPoints(startingPoint).1
		var count = 0
		repeat {
			count += 1
			let hold = next.location
			let allNext = maze.filter {$0.location == next.nextPipeLocation(start)}
			guard allNext.count == 1 else { fatalError() }
			next = maze.first { $0.location == next.nextPipeLocation(start) }!
			start = hold
		} while next.kind != .start
		return count
	}

	func computeDistances() {
		// find the start
		let start = startingPoint
		// get the connecting points
		var points = connectingPoints(start)
		var starting = (start,start)
		// for each connecting point, compute distances until the computed
		var count = 0
		repeat {
			count += 1
			// sanity check against starts
			guard points.0.kind != .start || points.1.kind != .start  else { fatalError() }
			// repeat unti lthe connecting points are equal (you'll be computing two
			// at a time in this loop, basically)
			// when they are equal, we'll have a single locatino that's farthest.
			let pointALocation = points.0.nextPipeLocation(starting.0.location)
			let pointA = maze.first { $0.location == pointALocation }
			let pointBLocation = points.1.nextPipeLocation(starting.1.location)
			let pointB = maze.first { $0.location == pointBLocation }
			guard pointA?.distanceFromStart == 0 && pointB?.distanceFromStart == 0 else {fatalError()}
			points.0.distanceFromStart = count
			points.1.distanceFromStart = count
			starting = points
			points = (pointA!, pointB!)
		} while points.0.location != points.1.location
	}

	var farthestPointFromStart: Pipe {
		maze.sorted { a, b in
			a.distanceFromStart > b.distanceFromStart
		}.first!
	}

	init(maze: [Pipe]) {
		self.maze = maze
//		computeDistances()
	}

	init(_ lines: [String]) {
		var array: [Pipe] = []
		for y in lines.enumerated() {
			for x in y.element.enumerated() {
				let kind = Pipe.Kind(x.element)
				let location = Point2D(x.offset,y.offset)
				array.append(Pipe(kind: kind, location: location, distanceFromStart: 0))
			}
		}
		self.init(maze: array)
	}
}
