/*
 In mathematics, a Diophantine equation is a polynomial equation, usually with two or more unknowns, such that only the integer solutions are sought or studied.
 
 In this kata we want to find all integers x, y (x >= 0, y >= 0) solutions of a diophantine equation of the form:
 
 x2 - 4 * y2 = n
 (where the unknowns are x and y, and n is a given positive number) in decreasing order of the positive xi.
 
 If there is no solution return [] or "[]" or "". (See "RUN SAMPLE TESTS" for examples of returns).
 
 Examples:
 solEquaStr(90005) --> "[[45003, 22501], [9003, 4499], [981, 467], [309, 37]]"
 solEquaStr(90002) --> "[]"
 Hint:
 x2 - 4 * y2 = (x - 2*y) * (x + 2*y)
 https://www.codewars.com/kata/554f76dca89983cc400000bb/train/swift
 */
import XCTest
//func factors(of number: Int) -> [Double] {
//    return (1...number).filter { number % $0 == 0 }.map {Double($0)}
//}

func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for \(title): \(timeElapsed) s.")
}

func factors(of n: Int) -> [Int] {
    precondition(n > 0, "n must be positive")
    let sqrtn = Int(Double(n).squareRoot())
    var factors: [Int] = []
    factors.reserveCapacity(2 * sqrtn)
    for i in 1...sqrtn {
        if n % i == 0 {
            factors.append(i)
        }
    }
    var j = factors.count - 1
    if factors[j] * factors[j] == n {
        j -= 1
    }
    while j >= 0 {
        factors.append(n / factors[j])
        j -= 1
    }
    return factors
}

func solequa(_ n: Int) -> [(Int, Int)] {
    let list = factors(of: n)
    let nD = Double(n)
    var result = [(Int, Int)]()
    for i1 in list {
        let i = Double(i1)
        let x: Double = i/2 + nD/(2*i)
        let xInterger = floor(x) == x
        if !xInterger || x <= 0 {
            continue
        }
        let y: Double = (x - i)/2
        let yInterger = floor(y) == y
        if !yInterger || y <= 0 {
            continue
        }
        result.append((Int(x), Int(y)))
    }
    print("--->Result:\(result)")
    return result
}

//
//
func testing(_ n: Int, _ expected: [(Int, Int)]) {
    let ans  = solequa(n)
    if ans.count == expected.count {
        for i in 0..<expected.count {
            XCTAssertTrue(ans[i] == expected[i], "Actual and Expected don't have same value at index \(i) -> expected \(expected[i])")
        }
    }
    else {XCTAssertEqual(ans.count, expected.count, "Actual and Expected don't have same length")}
}

func testExample() {
//    testing(5, [(3, 1)])
//    testing(12, [(4, 1)])
//    testing(13, [(7, 3)])
//    testing(9001, [(4501, 2250)])
    testing(9005, [(4503, 2251), (903, 449)])
//     testing
//    testing(10, [])
}


printTimeElapsedWhenRunningCode(title: "CheckTime") {
    solequa(25543795)
}



