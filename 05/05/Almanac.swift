//
//  Almanac.swift
//  05
//
//  Created by Russell Mirabelli on 12/4/23.
//

import Foundation

struct AlmanacMap {
	let sources: [Int]
	let destinations: [Int]
	let sizes: [Int]
	func valueFor(_ source: Int) -> Int {
		for s in sources.enumerated() {
			if source >= s.element && source < s.element + sizes[s.offset] {
				return destinations[s.offset] + source - s.element
			}
		}
		return source
	}
	init(sources: [Int], destinations: [Int], sizes: [Int]) {
		self.sources = sources
		self.destinations = destinations
		self.sizes = sizes
	}
	init(s: inout [String]) {
		s.append("")
		s.removeFirst()
		var line = ""
		var sources: [Int] = []
		var destinations: [Int] = []
		var sizes: [Int] = []
		line = s.removeFirst()
		repeat {
			let components = line.components(separatedBy: " ")
			destinations.append(Int(components[0])!)
			sources.append(Int(components[1])!)
			sizes.append(Int(components[2])!)
				line = s.removeFirst()
		} while line.count > 0 && !s.isEmpty
		self.init(sources: sources, destinations: destinations, sizes: sizes)
	}
}

struct Almanac {
	let seeds: [Int]
	let seedToSoil: AlmanacMap
	let soilToFertilizer: AlmanacMap
	let fertilizerToWater: AlmanacMap
	let waterToLight: AlmanacMap
	let lightToTemperature: AlmanacMap
	let temperatureToHumidity: AlmanacMap
	let humidityToLocation: AlmanacMap

	init(seeds: [Int], seedToSoil: AlmanacMap, soilToFertilizer: AlmanacMap, fertilizerToWater: AlmanacMap, waterToLight: AlmanacMap, lightToTemperature: AlmanacMap, temperatureToHumidity: AlmanacMap, humidityToLocation: AlmanacMap) {
		self.seeds = seeds
		self.seedToSoil = seedToSoil
		self.soilToFertilizer = soilToFertilizer
		self.fertilizerToWater = fertilizerToWater
		self.waterToLight = waterToLight
		self.lightToTemperature = lightToTemperature
		self.temperatureToHumidity = temperatureToHumidity
		self.humidityToLocation = humidityToLocation
	}

	init(s: [String]) {
		var s = s
		// seeds: 79 14 55 13
		let seedLine = s.removeFirst()
		let seedComponents = seedLine.components(separatedBy: ":")
		let seedValues = seedComponents[1].split(separator: " ").map{ Int($0)! }

		// skip a line.
		s.removeFirst()

		let seedToSoil = AlmanacMap(s: &s)
		let soilToFertilizer = AlmanacMap(s: &s)
		let fertilizerToWater = AlmanacMap(s: &s)
		let waterToLight = AlmanacMap(s: &s)
		let lightToTemperature = AlmanacMap(s: &s)
		let temperatureToHumidity = AlmanacMap(s: &s)
		let humidityToLocation = AlmanacMap(s: &s)
		self.init(seeds: seedValues, seedToSoil: seedToSoil, soilToFertilizer: soilToFertilizer, fertilizerToWater: fertilizerToWater, waterToLight: waterToLight, lightToTemperature: lightToTemperature, temperatureToHumidity: temperatureToHumidity, humidityToLocation: humidityToLocation)
	}
}
