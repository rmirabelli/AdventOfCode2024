//
//  Protocols.swift
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation

public protocol DataProtocol {
    var data: [String] { get }
    var name: String {get}
}

public protocol SolutionProtocol {
    func execute(_ data: [String]) -> String
    var name: String {get}
}

public protocol DrawablePoint {
    var point: Point2D { get }
    var char: Character { get }
}
