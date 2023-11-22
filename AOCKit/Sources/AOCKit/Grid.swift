//
//  Grid.swift
//
//
//  Created by Russell Mirabelli on 11/22/23.
//

import Foundation
import SwiftUI

public struct Grid {
    /// Set up a grid with these variables
    let xDimension: Int
    let yDimension: Int
    let emptyCharacter: Character
    let fontSize: Double = 5.0

    public init(xDimension: Int, yDimension: Int, emptyCharacter: Character) {
        self.xDimension = xDimension
        self.yDimension = yDimension
        self.emptyCharacter = emptyCharacter
    }

    /// Prepare an empty grid. Pass this in to
    /// the render function each time you
    /// want to show some points
    public var emptyGrid: [String] {
        let emptyLine = String(repeating: emptyCharacter, count: xDimension)
        return [String](repeating: emptyLine, count: yDimension)
    }

    /// Modify an empty grid with drawable points.
    public func render(drawablePoints: [DrawablePoint], into lines: [String]) -> [String] {
        var returnLines = lines
        for point in drawablePoints {
            let idx = lines[point.y].index(lines[point.y].startIndex, offsetBy: point.x)
            returnLines[point.y].remove(at: idx)
            returnLines[point.y].insert(point.char, at: idx)
        }
        return returnLines
    }
}

extension DrawablePoint {
    var x: Int { point.x }
    var y: Int { point .y }
}

@available(macOS 10.15, *)
extension Grid {
    public func rendered(drawablePoints: [DrawablePoint]) -> Text {
        let empty = emptyGrid
        let filled = render(drawablePoints: drawablePoints, into: empty)
        let str = filled.joined(separator: "\n")
        return Text(str).font(Font.custom("Monaco", size: 15.0))
    }
}
