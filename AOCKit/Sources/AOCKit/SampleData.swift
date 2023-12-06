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
            var usable = full.components(separatedBy: "\n")
            if usable.last!.isEmpty {
                usable.removeLast()
            }
            return usable
        } catch {
            print("Error reading file \(error)")
        }
        return []
    }
    public init() {
        
    }
}
