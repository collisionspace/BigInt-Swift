//
//  BigInt.swift
//  BigIntExample
//
//  Created by Daniel Slone on 8/23/19.
//  Copyright © 2019 Daniel Slone. All rights reserved.
//

import Foundation

struct BigInt {
    var value: String

    static let zero = BigInt(value: "0")
    static let one = BigInt(value: "1")
}

func +(lhs: BigInt, rhs: BigInt) -> BigInt {
    var lhsCopy = lhs
    var rhsCopy = rhs

    if lhs.value.count > rhs.value.count {
        swap(&lhsCopy, &rhsCopy)
    }

    var resultString = ""

    let n1 = lhsCopy.value.count
    let n2 = rhsCopy.value.count
    let diff = n2 - n1

    var carry = 0

    var i = n1 - 1
    while i >= 0 {
        let lhsValue = lhsCopy.value[i]
        let rhsValue = rhsCopy.value[i + diff]
        if let intLhs = Int(lhsValue), let intRhs = Int(rhsValue) {
            let sum = intLhs + intRhs + carry
            resultString += String(sum % 10)
            carry = sum/10
            i -= 1
        } else {
            assertionFailure("Value isn't a number")
        }
    }

    i = n2 - n1 - 1
    while i >= 0 {
        if let intRhs = Int(rhsCopy.value[i]) {
            let sum = intRhs + carry
            resultString += String(sum % 10)
            carry = sum/10
            i -= 1
        } else {
            assertionFailure("Value isn't a number")
        }
    }

    if carry > 0 {
        resultString.append("\(carry)")
    }

    return BigInt(value: String(resultString.reversed()))
}

private extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
