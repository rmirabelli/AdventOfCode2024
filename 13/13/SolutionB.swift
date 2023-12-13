//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

func twiddle(grid: TextGrid, at index: Int) {
	let current = grid.characterAtIndex(index)
	if current == "." {
		grid.replace(c: "#", at: index)
	} else {
		grid.replace(c: ".", at: index)
	}
}

func findSmudgedValue(grid: TextGrid) -> Int {
	let totalCharacterCount = grid.width * grid.height
	for i in 0..<totalCharacterCount {
		twiddle(grid: grid, at: i)
		let horizontal = singleMirrorPoint(grid.allRows())
		let vertical = singleMirrorPoint(grid.allColumns()) * 100
		let score = horizontal + vertical
		if score > 0 {
			twiddle(grid: grid, at: i)
			return score
		}
		twiddle(grid: grid, at: i)
	}
	return -1
}

struct SolutionB: SolutionProtocol {
	var name = "Day 13 part 2"
    func execute(_ data: [String]) -> String {
		let maps = data.split(separator: "")
		let grids = maps.map { TextGrid(Array($0)) }
		let smudgedValues = grids.map { findSmudgedValue(grid: $0) }
		let total = smudgedValues.reduce(0) { $0 + $1 }
//		let horizontal = grids.map { singleMirrorPoint($0.allRows()) }
//		let vertical = grids.map { singleMirrorPoint($0.allColumns()) }
//		let total = horizontal.reduce(0){$0+$1} + (vertical.reduce(0){$0+$1} * 100)
		return "\(total)"
    }
}
