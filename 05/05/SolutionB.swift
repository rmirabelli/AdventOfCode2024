//
//  SolutionB.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit
import Algorithms

struct SolutionB: SolutionProtocol {
    var name = "Solution B"
    func execute(_ data: [String]) -> String {
		let almanac = Almanac(s: data)
		let seeds = almanac.seeds
		let seedPairs = seeds.chunks(ofCount: 2).map { s in
			(s.first!,s.last!)
		}

		//ok, for each of the seed pairs:
			//grab the seed to soils. If the start point of that seed to soil
			// is in the pair's range, then it's a potential match.

		// This is the correct approach, but it has to be done for EVERY STEP,
		// not just the first step.

		let seedToSoil = almanac.seedToSoil.sources
		var validSources: [Int] = []
		for s in seedToSoil.enumerated() {
			for p in seedPairs {
				let seedToSoilRange = ClosedRange(uncheckedBounds: (s.element, s.element + almanac.seedToSoil.sizes[s.offset]))
				let pairRange = ClosedRange(uncheckedBounds: (p.0, p.0 + p.1))
				let overlapped = seedToSoilRange.overlaps(pairRange)
				if overlapped {
					validSources.append(max(s.element,p.0))
				}
			}
		}

		let locations = validSources.map { almanac.humidityToLocation.valueFor(almanac.temperatureToHumidity.valueFor(almanac.lightToTemperature.valueFor(almanac.waterToLight.valueFor(almanac.fertilizerToWater.valueFor(almanac.soilToFertilizer.valueFor(almanac.seedToSoil.valueFor($0))))))) }
		let minimum = locations.min()!
//		let minimum = 0
		return "\(minimum)"
    }
}
