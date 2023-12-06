//
//  RaceInfo.swift
//  06
//
//  Created by Russell Mirabelli on 12/6/23.
//

import Foundation
//Time:      7  15   30
//Distance:  9  40  200

struct RaceInfo {
	let time: Int
	let distance: Int

	func distances() -> [Int] {
		return []
	}

	static func singleRace(_ data: [String]) -> RaceInfo {
		let timeLine = data[0]
		let distanceLine = data[1]
		let times = timeLine.components(separatedBy: ":").last!.split(separator: " ").map { $0 }
		let distances = distanceLine.components(separatedBy: ":").last!.split(separator: " ").map { $0 }
		let singleTime = times.joined()
		let singleDistance = distances.joined()
		return RaceInfo(time: Int(singleTime)!, distance: Int(singleDistance)!)
	}

	static func races(_ data: [String]) -> [RaceInfo] {
		let timeLine = data[0]
		let distanceLine = data[1]
		let times = timeLine.components(separatedBy: ":").last!.split(separator: " ").map { Int($0)! }
		let distances = distanceLine.components(separatedBy: ":").last!.split(separator: " ").map { Int($0)! }
		let zip = zip(times, distances)
		let info = zip.map { (t,d) in
			RaceInfo(time: t, distance: d)
		}
		return info
	}
}

