//
//  GhostMap.swift
//  08
//
//  Created by Russell Mirabelli on 12/8/23.
//

import Foundation
import Algorithms

struct GhostMap {
	enum Walk {
		case left
		case right
		init(_ c: Character) {
			switch c {
				case "L": self = .left
				case "R": self = .right
				default: fatalError()
			}
		}
	}

	class NamedNode: Equatable {
		static func == (lhs: GhostMap.NamedNode, rhs: GhostMap.NamedNode) -> Bool {
			lhs.name == rhs.name
		}

		let name: String
		var left: NamedNode?
		var right: NamedNode?

		init(name: String, left: NamedNode?, right: NamedNode?) {
			self.name = name
			self.left = left
			self.right = right
		}
	}

	let cycle: [Walk]
	let allNodes: [NamedNode]

	init(cycleLine: String, nodeLines: [String]) {
		cycle = cycleLine.map { Walk($0) }
		var nodes: [NamedNode] = []
		for line in nodeLines {
			//AAA = (BBB, CCC)
			let split = line.split(separator: " ")
			let root = String(split[0])
			let left = String(split[2].replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ",", with: ""))
			let right = String(split[3].replacingOccurrences(of: ")", with: ""))
			let rootNode = nodes.filter { $0.name == root }.first ?? NamedNode(name: root, left: nil, right: nil)
			if !nodes.contains(rootNode) {
				nodes.append(rootNode)
			}
			let leftNode = nodes.filter { $0.name == left }.first ?? NamedNode(name: left, left: nil, right: nil)
			if !nodes.contains(leftNode) {
				nodes.append(leftNode)
			}
			let rightNode = nodes.filter { $0.name == right }.first ?? NamedNode(name: right, left: nil, right: nil)
			if !nodes.contains(rightNode) {
				nodes.append(rightNode)
			}
			rootNode.left = leftNode
			rootNode.right = rightNode
			if !nodes.contains(rootNode) {
				nodes.append(rootNode)
			}
		}
		self.allNodes = nodes
	}

	init(_ full: [String]) {
		var lessFull = full
		lessFull.removeFirst(2)
		self.init(cycleLine: full[0], nodeLines: lessFull)
	}

	func findNode(_ name: String) -> NamedNode {
		allNodes.filter { $0.name == name }.first!
	}

	func findNodes(endingIn: Character) -> [NamedNode] {
		allNodes.filter { $0.name.last! == endingIn }
	}

	func runCommand(index: Int, from: NamedNode) -> NamedNode {
		let trueIndex = index % cycle.count
		let command = cycle[trueIndex]
		switch command {
			case .left: return from.left!
			case .right: return from.right!
		}
	}

	func steps(_ from: String, _ to: String) -> Int {
		var node: NamedNode? = findNode(from)
		var count = 0
		let cycled = cycle.cycled()
		for command in cycled {
			count += 1
			switch command {
				case .left: node = node?.left
				case .right: node = node?.right
			}
			if node?.name == to {
				return count
			}
		}
		return 0
	}
	func stepsToEnd(_ from: String, _ to: Character) -> Int {
		var node: NamedNode? = findNode(from)
		var count = 0
		let cycled = cycle.cycled()
		for command in cycled {
			count += 1
			switch command {
				case .left: node = node?.left
				case .right: node = node?.right
			}
			if node?.name.last! == to {
				return count
			}
		}
		return 0
	}

}
