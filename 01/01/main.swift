//
//  main.swift
//  01
//
//  Created by Russell Mirabelli on 10/14/23.
//

import Foundation
import AOCKit

executeTimedSolution(SolutionA(), SampleData())
executeTimedSolution(SolutionA(), RealData())
executeTimedSolution(SolutionB(), SampleData())
executeTimedSolution(SolutionB(), RealData())

func executeTimedSolution(_ solution: SolutionProtocol, _ data: AOCKit.DataProtocol) {
    let start = Date()
    let result = solution.execute(data.data)
    let end = Date()
    let elapsed = end.timeIntervalSince(start)
    print("\(solution.name) answer for \(data.name): \(result)\n Computed in \(elapsed)s")
}

