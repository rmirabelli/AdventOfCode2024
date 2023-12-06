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
