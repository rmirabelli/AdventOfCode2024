//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionA: SolutionProtocol {
	var name = "Day 10 part 1"
    func execute(_ data: [String]) -> String {
		let maze = PipeMaze(data)
//		let farthestPoint = maze.farthestPointFromStart
//		let farthest = maze.farthestPointFromStart.distanceFromStart + 1
//		return "The farthest point is \(farthest)"
		let fullLoopLength = maze.loopLength()
		let half = fullLoopLength / 2
		return ("midpoint is \(half)")
    }
}
