//
//  Point2D.swift
//
//
//  Created by Russell Mirabelli on 11/22/23.
//

import Foundation

public struct Point2D {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public func manhattanDistance(_ other: Point2D) -> Int {
        abs(x - other.x) + abs(y - other.y)
    }

	public func cartesianDistance(_ other: Point2D) -> Int {
		let xDistance = Float(abs(x - other.x))
		let yDistance = Float(abs(y - other.y))
		let hyp = sqrt((xDistance * xDistance) + (xDistance * xDistance))
		return Int(max(xDistance,(max(yDistance, hyp))))
	}
}
