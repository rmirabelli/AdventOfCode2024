//
//  Protocols.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

protocol DataProtocol {
    var data: [String] { get }
}

protocol SolutionProtocol {
    func execute(_ data: [String]) -> String
}
