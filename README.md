# AdventOfCode2023

## Grabbing the data via cURL:

First, using a web browser, find the "Cookie" value for AOC data, and place it in your .zshrc using the name $AOC_COOKIE

Then use the following command:
```
curl 'https://adventofcode.com/input' --header "Cookie: $AOC_COOKIE"
```

You can get a previous day's input with (for example):
```
curl 'https://adventofcode.com/2022/day/22/input' --header "Cookie: $AOC_COOKIE"
```

## Packages added and in use

`swift-algorithms` will come in *very* handy, it provides lots of shortcuts for processing lists beyond trivial map/filter/reduce

`SwiftGraph` provides basic Graph manipulation. If we need to do it, fine.

## The AOCKit package

This can be referenced in any day's project pretty easily.

It contains methods for data and the executors.

The `main` for any given day will simply call SolutionA and SolutionB using sample & real data, in turn.

There's also a `Point2D` class for 2D graphics, because that's always needed.

The `Grid` functionality can provide visualizers -- both String and Text (SwiftUI) -- because you'll want to see your output sometimes. It works with sparse data that conforms to a specific protocol.

## Scratchpad

This is a solution I wrote for something or another, it's here to hold the notes.

        var data = data
        data.removeLast()
//        let lineName = Reference(Substring.self)
        let number = Reference(Int.self)
//        let r = /Line (.)/
        let bigger = Regex {
            "Line "
            TryCapture(as: number) {
                OneOrMore(.digit)
            } transform: { w in
                Int(w)
            }
        }
//        let s = try! bigger.firstMatch(in: data.first!)!
        let a = data.map { try! bigger.firstMatch(in: $0)![number] }
        let nums = a.map {Int($0)}
        let nums2 = nums.uniquePermutations(ofCount: 2)
        for n in nums2 {
            print(n[0])
        }
        let sum = nums.reduce(0) { partialResult, val in
            partialResult + val
        }
        return "\(sum)"

