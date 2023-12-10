//
//  FileData.swift
//
//
//  Created by Russell Mirabelli on 12/10/23.
//

import Foundation
public struct FileData: DataProtocol {
	public var name = "Sample"
	public var data: [String] {
		do {
			let full = try String(contentsOfFile: "\(name).txt")
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
	public init(_ name: String) {
		self.name = name
	}
}
