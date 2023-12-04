//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
import Algorithms


struct SolutionA: SolutionProtocol {
	var name = "Solution A"
    func execute(_ data: [String]) -> String {
		let tickets = data.map{ Ticket(line: $0) }
		return "\(tickets.reduce(0) {$0 + $1.score})"
    }
}
