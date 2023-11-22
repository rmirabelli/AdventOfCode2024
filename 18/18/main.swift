//
//  main.swift
//  18
//
//  Created by Russell Mirabelli on 10/14/23.
//

import Foundation

executeTimedSolution(SolutionA(), SampleData())
//executeTimedSolution(SolutionA(), RealData())
//executeTimedSolution(SolutionB(), SampleData())
//executeTimedSolution(SolutionB(), RealData())

func executeTimedSolution(_ solution: SolutionProtocol, _ data: DataProtocol) {
    let start = Date()
    let result = solution.execute(data.data)
    let end = Date()
    let elapsed = end.timeIntervalSince(start)
    print("Answer: \(result)\n Computed in \(elapsed)s")
}

