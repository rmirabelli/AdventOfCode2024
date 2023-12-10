//
//  SampleData.swift
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

public struct SampleData2: DataProtocol {
    public var name = "Sample2"
    public var data: [String] {
        do {
            let full = try String(contentsOfFile: "SampleData2.txt")
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
