//
//  File.swift
//  
//
//  Created by Russell Mirabelli on 12/11/23.
//

import Foundation

class TextGrid {
	let data: String
	let width: Int
	let height: Int

	init(data: String, width: Int, height: Int) {
		self.data = data
		self.width = width
		self.height = height
	}

	convenience init(_ s: [String]) {
		self.init(data: s.joined(), width: s.first!.count, height: s.count)
	}

	func characterAt(_ x: Int, _ y: Int) -> Character {
		guard x < width && y < height else { fatalError() }
		let index = data.index(data.startIndex, offsetBy: y*height+x)
		return data[index]
	}

	func lineContains(lineNumber: Int, character: Character) -> Bool {
		let line = line(lineNumber)
		return line.contains(character)
	}

	func columnContains(columnNumber: Int, character: Character) -> Bool {
		let column = column(columnNumber)
		return column.contains(character)
	}

	func line(_ lineNumber: Int) -> String {
		guard lineNumber < height else { fatalError() }
		let startingIndex = data.index(data.startIndex, offsetBy: lineNumber*height)
		let endIndex = data.index(startingIndex, offsetBy: width)
		return String(data[startingIndex..<endIndex])
	}

	func column(_ columnNumber: Int) -> String {
		let totalCount = width * height
		let stride = stride(from: columnNumber, to: totalCount, by: width)
		let chars = stride.map { data[data.index(data.startIndex, offsetBy: $0)] }
		return String(chars)
	}

	func insertRow(at: Int, s: String) {
		fatalError()
	}

	func insertColumn(at: Int, s: String) {
		fatalError()
	}
}
