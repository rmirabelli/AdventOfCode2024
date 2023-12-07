//
//  CamelHand.swift
//  07
//
//  Created by Russell Mirabelli on 12/6/23.
//

import Foundation

enum Card: Comparable {
	case ace, king, queen, jack, ten, nine, eight, seven, six, five, four, three, two, joker

	init(_ s: Character) {
		switch s {
			case "A": self = .ace
			case "K": self = .king
			case "Q": self = .queen
			case "J": self = .jack
			case "T": self = .ten
			case "9": self = .nine
			case "8": self = .eight
			case "7": self = .seven
			case "6": self = .six
			case "5": self = .five
			case "4": self = .four
			case "3": self = .three
			case "2": self = .two
			case "j": self = .joker
			default: fatalError()
		}
	}
}

struct CamelHand: Comparable, Equatable {
	static func < (lhs: CamelHand, rhs: CamelHand) -> Bool {
		let lhsHand = lhs.cards
		let rhsHand = rhs.cards
		let lhsType = lhs.handType
		let rhsType = rhs.handType
		if lhs.handType == rhs.handType {
			// card by card comparison
			let zipped = zip(lhsHand, rhsHand)
			for z in zipped {
				if z.0 == z.1 {
					continue
				}
				return z.0 < z.1
			}
		}
		return lhsType < rhsType
	}

	let cards: [Card]
	let bid: Int

	init(cards: [Card], bid: Int) {
		self.cards = cards
		self.bid = bid
	}

	init(_ s: String) {
		let parts = s.split(separator: " ")
		let cardPart = parts[0]
		let cards = cardPart.map {Card($0)}
		let bid = Int(parts[1])!
		self.init(cards: cards, bid: bid)
	}

//	Five of a kind, where all five cards have the same label: AAAAA
//	Four of a kind, where four cards have the same label and one card has a different label: AA8AA
//	Full house, where three cards have the same label, and the remaining two cards share a different label: 23332
//	Three of a kind, where three cards have the same label, and the remaining two cards are each different from any other card in the hand: TTT98
//	Two pair, where two cards share one label, two other cards share a second label, and the remaining card has a third label: 23432
//	One pair, where two cards share one label, and the other three cards have a different label from the pair and each other: A23A4
//	High card, where all cards' labels are distinct: 23456

	enum HandType: Comparable {
		case fiveOfAKind, fourOfAKind, fullHouse, threeOfAKind, twoPair, onePair, highCard
	}

	var handType: HandType {
		var dictionary = Dictionary(grouping: cards) { $0 }
		let jokerCount = dictionary[.joker]?.count ?? 0
		if jokerCount != 5 {
			dictionary.removeValue(forKey: .joker)
		}
		if dictionary.values.count == 1 {
			return .fiveOfAKind
		}
		if dictionary.values.count == 2 {
			let sorted = dictionary.values.sorted { a, b in
				a.count > b.count
			}
			if sorted.first!.count + jokerCount == 4 {
				return .fourOfAKind
			}
			if sorted.first!.count + jokerCount == 3 {
				return .fullHouse
			}
		}
		if dictionary.values.count == 3 {
			let sorted = dictionary.values.sorted { a, b in
				a.count > b.count
			}
			if sorted.first!.count + jokerCount == 3 {
				return .threeOfAKind
			}
			if sorted.first!.count + jokerCount == 2 {
				return .twoPair
			}
		}
		if dictionary.values.count == 4 {
			let sorted = dictionary.values.sorted { a, b in
				a.count > b.count
			}
			if sorted.first!.count + jokerCount == 2 {
				return .onePair
			}
		}
		return .highCard
	}

}
