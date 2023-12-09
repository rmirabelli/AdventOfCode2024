//
//  SolutionA.swift
//  09
//
//  Created by Russell Mirabelli on 12/9/23.
//

import Foundation
import AOCKit

struct SolutionA: SolutionProtocol {
	var name = "Day 9 part 1"
	func execute(_ data: [String]) -> String {
		let oasis = Oasis(data)
		return "\(oasis.prediction())"
	}
}
