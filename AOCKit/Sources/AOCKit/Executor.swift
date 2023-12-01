//
//  Executor.swift
//  
//
//  Created by Russell Mirabelli on 11/22/23.
//

import Foundation
public func executeTimedSolution(_ solution: SolutionProtocol, _ data: AOCKit.DataProtocol) {
    let start = Date()
    let result = solution.execute(data.data)
    let end = Date()
    let elapsed = end.timeIntervalSince(start)
    print("\(solution.name) answer for \(data.name): \(result)\n Computed in \(elapsed)s")
}

