//
//  SolutionA.swift
//  01
//
//  Created by Russell Mirabelli on 11/9/23.
//

import Foundation
import AOCKit

struct SolutionA: SolutionProtocol {
    var name = "Solution A"
    func execute(_ data: [String]) -> String {
		let almanac = Almanac(s: data)
		let seeds = almanac.seeds
		let locations = seeds.map { almanac.humidityToLocation.valueFor(almanac.temperatureToHumidity.valueFor(almanac.lightToTemperature.valueFor(almanac.waterToLight.valueFor(almanac.fertilizerToWater.valueFor(almanac.soilToFertilizer.valueFor(almanac.seedToSoil.valueFor($0))))))) }
		let minimum = locations.min()!
        return "\(minimum)"
    }
}
