//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

class SolutionB: SolutionProtocol {
	var name = "Solution B"
	var tickets: [Ticket]

	init(name: String = "Solution B") {
		self.name = name
		self.tickets = []
	}

	func copies(_ startingIndex: Int) -> Int {
		let count = tickets[startingIndex].matchCount
		if count == 0 { return 1 }
		var totalTickets = 0
		for i in 0..<count {
			totalTickets += copies(startingIndex+i+1)
		}
		return 1 + totalTickets
	}

    func execute(_ data: [String]) -> String {
		tickets = data.map{ Ticket(line: $0) }
		var totalTickets = 0
		for i in 0..<tickets.count {
			totalTickets += copies(i)
		}
		return "\(totalTickets)"
    }
}
