//
//  SampleData.swift
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

public struct SampleData: DataProtocol {
    public var name = "Sample"
    public var data: [String] {
        do {
            let full = try String(contentsOfFile: "SampleData.txt")
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
