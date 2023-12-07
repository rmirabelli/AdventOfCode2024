//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionB: SolutionProtocol {
	var name = "b"
    func execute(_ data: [String]) -> String {
		let cardsWithJokers = data.map { $0.replacingOccurrences(of: "J", with: "j") }
		let hands = cardsWithJokers.map { CamelHand($0) }
		let enumerated = hands.sorted().reversed().enumerated()
		let reduced = enumerated.reduce(0) { partialResult, e in
			partialResult + (e.offset + 1) * e.element.bid
		}
		return "\(reduced)"
    }
}
