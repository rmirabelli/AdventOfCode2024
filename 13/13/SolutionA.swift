//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

extension String {
	var mirrorPoints: [Int] {
		var points: [Int] = []
		for i in 1..<count {
			let firstBit = prefix(i)
			let secondBit = suffix(count - i)
			let compareLength = min(firstBit.count, secondBit.count)
			let firstTrim = firstBit.suffix(compareLength)
			let secondTrim = secondBit.prefix(compareLength)
			let secondReverse = String(secondTrim.reversed())
			if firstTrim == secondReverse {
				points.append(i)
			}
		}
		return points
	}
}

func mapMirrorPoints(_ d: [String]) -> [Int] {
	let map = d.map { line in
		Set(line.mirrorPoints)
	}
	let combined = map.reduce(map[0]) { $0.intersection($1) }
	return Array(combined)
}

func singleMirrorPoint(_ d: [String]) -> Int {
	let m = mapMirrorPoints(d)
	guard m.count <= 1 else { fatalError() }
	return m.first ?? 0
}

struct SolutionA: SolutionProtocol {
	var name = "Day 13 part 1"
    func execute(_ data: [String]) -> String {
		let maps = data.split(separator: "")
		let horizontal = maps.map { singleMirrorPoint(Array($0)) }
		let grids = maps.map { TextGrid(Array($0)) }
		let vertical = grids.map { singleMirrorPoint($0.allColumns()) }
		let total = horizontal.reduce(0){$0+$1} + (vertical.reduce(0){$0+$1} * 100)
        return "\(total)"
    }
}

