//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import RegexBuilder
import AOCKit
import Algorithms

struct SolutionA: SolutionProtocol {
    var name = "Day 1 part 1"
    func execute(_ data: [String]) -> String {
        var data = data
        data.removeLast()
//        let lineName = Reference(Substring.self)
        let number = Reference(Int.self)
//        let r = /Line (.)/
        let bigger = Regex {
            "Line "
            TryCapture(as: number) {
                OneOrMore(.digit)
            } transform: { w in
                Int(w)
            }
        }
//        let s = try! bigger.firstMatch(in: data.first!)!
        let a = data.map { try! bigger.firstMatch(in: $0)![number] }
        let nums = a.map {Int($0)}
        let nums2 = nums.uniquePermutations(ofCount: 2)
        for n in nums2 {
            print(n[0])
        }
        let sum = nums.reduce(0) { partialResult, val in
            partialResult + val
        }
        return "\(sum)"
    }
}
