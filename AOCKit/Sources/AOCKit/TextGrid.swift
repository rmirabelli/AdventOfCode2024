//
//  File.swift
//  
//
//  Created by Russell Mirabelli on 12/11/23.
//

import Foundation

public class TextGrid {
	var data: String
	public let width: Int
	public let height: Int

	public init(data: String, width: Int, height: Int) {
		self.data = data
		self.width = width
		self.height = height
	}

	public convenience init(_ s: [String]) {
		self.init(data: s.joined(), width: s.first!.count, height: s.count)
	}

	public func characterAt(_ x: Int, _ y: Int) -> Character {
		guard x < width && y < height else { fatalError() }
		let index = data.index(data.startIndex, offsetBy: y*height+x)
		return data[index]
	}

	public func characterAtIndex(_ index: Int) -> Character {
		data[data.index(data.startIndex, offsetBy: index)]
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
		let startingIndex = data.index(data.startIndex, offsetBy: lineNumber*width)
		let endIndex = data.index(startingIndex, offsetBy: width)
		return String(data[startingIndex..<endIndex])
	}

	public func column(_ columnNumber: Int) -> String {
		let totalCount = width * height
		let stride = stride(from: columnNumber, to: totalCount, by: width)
		let chars = stride.map { data[data.index(data.startIndex, offsetBy: $0)] }
		return String(chars)
	}

	public func replace(c: Character, at index: Int) {
		let start = data.index(data.startIndex, offsetBy: index)
		let end = start
		data.replaceSubrange(start...end, with: [c])
	}

	public func allColumns() -> [String] {
		return ( 0..<width ).map { column($0) }
	}
	public func allRows() -> [String] {
		return ( 0..<height ).map { line($0) }
	}

	func insertRow(at: Int, s: String) {
		fatalError()
	}

	func insertColumn(at: Int, s: String) {
		fatalError()
	}
}
