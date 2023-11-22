//
//  SampleData.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

struct SampleData: DataProtocol {
    let input = """
line one
line two
"""
    var data: [String] {
        input.components(separatedBy: "\n")
    }

}
