//
//  Ticket.swift
//  04
//
//  Created by Russell Mirabelli on 12/3/23.
//

import Foundation

struct Ticket {
	let name: String
	let number: Int
	let winningNumbers: [Int]
	let cardNumbers: [Int]

	init(name: String, winningNumbers: [Int], cardNumbers: [Int]) {
		self.name = name
		self.number = Int(name.split(separator: " ").last!)!
		self.winningNumbers = winningNumbers
		self.cardNumbers = cardNumbers
	}

	init(line: String) {
		let components = line.components(separatedBy: ":")
		let name = components[0]
		let numbers = components[1]
		let numberComponents = numbers.components(separatedBy: "|")
		let winning = numberComponents[0].split(separator: " ").map{Int(String($0))!}
		let selected = numberComponents[1].split(separator: " ").map{ Int(String($0))! }
		self.init(name: name,winningNumbers: winning,cardNumbers: selected)
	}

	var matchCount: Int {
		Set(cardNumbers).intersection(Set(winningNumbers)).count
	}

		// for part 1
	var score: Int {
		Int(pow(Double(2),Double(matchCount-1)))
	}

}
