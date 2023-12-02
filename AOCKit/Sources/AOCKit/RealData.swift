//
//  RealData.swift
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

public struct RealData: DataProtocol {
    public var name = "Real"
    public var data: [String] {
        do {
            let full = try String(contentsOfFile: "RealData.txt")
			var allLines = full.components(separatedBy: "\n")
			if allLines.last!.isEmpty {
				allLines.removeLast()
			}
			return allLines
        } catch {
            print("Error reading file \(error)")
        }
        return []
    }
    public init() {
    }
}
