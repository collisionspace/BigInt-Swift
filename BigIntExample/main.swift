//
//  main.swift
//  BigIntExample
//
//  Created by Daniel Slone on 8/23/19.
//  Copyright © 2019 Daniel Slone. All rights reserved.
//

import Foundation

func fibonacci(location: Int64) -> BigInt {
    if location <= 2 {
        return BigInt.one
    }
    
    var first = BigInt.one
    var second = BigInt.one
    var index: Int64 = 2
    
    while index < location {
        let number = first + second
        first = second
        second = number
        index += 1
    }
    return second
}

func timeFibonacci(location: Int64) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let thousandFibonacci = fibonacci(location: location)
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("location: \(location),\nfibo \(thousandFibonacci), \ntime elapsed \(timeElapsed)\n")
}


timeFibonacci(location: 8)
timeFibonacci(location: 10)
timeFibonacci(location: 100)
timeFibonacci(location: 1000)
