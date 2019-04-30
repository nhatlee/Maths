//func linearSearch<T: Equatable>(object: T, in list:[T]) -> Int? {
//    for (idx, val) in list.enumerated() where val == object {
//        return idx
//    }
//    return nil
//}
//
//let l = [1, 3, 2, 5, 7]
//
//print("Index of 7: \(linearSearch(object: 7, in: l))")
//
//func countOccurrencesOfKey(_ key: Int, inArray a: [Int]) -> Int {
//    func leftBoundary() -> Int {
//        var low = 0
//        var high = a.count
//        while low < high {
//            let midIndex = low + (high - low)/2
//            if a[midIndex] < key {
//                low = midIndex + 1
//            } else {
//                high = midIndex
//            }
//        }
//        return low
//    }
//
//    func rightBoundary() -> Int {
//        var low = 0
//        var high = a.count
//        while low < high {
//            let midIndex = low + (high - low)/2
//            if a[midIndex] > key {
//                high = midIndex
//            } else {
//                low = midIndex + 1
//            }
//        }
//        return low
//    }
//    print("rightBoundary():\(leftBoundary())")
//    return rightBoundary() - leftBoundary()
//}
//
//let a = [ 0, 1, 3, 3, 3, 3, 3, 6, 8]
//
//let c = countOccurrencesOfKey(3, inArray: a)  // returns 4
//print("c:\(c)")
//


func findMinMax(list: [Int]) -> (min: Int?, max: Int?)? {
    guard var min = list.first else {
        return nil
    }
    var max = min
    for val in list {
        if min > val {
            min = val
        } else if max < val {
            max = val
        }
    }
    return (min: min, max: max)
}


let list = [1, 3, 0, 5, 9, 9, 11, 70, 100, 8 , 3, 9]
print(findMinMax(list: list))

func findMinMaxV2(list: [Int]) -> (min: Int?, max: Int?)? {
    guard var min = list.first else { return nil }
    var max = min
    let start = list.count % 2
    for i in stride(from: start, to: list.count, by: 2) {
        let pair = (list[i], list[i+1])
        if pair.0 > pair.1 {
            if min > pair.1 {
                min = pair.1
            }
            if max < pair.0 {
                max = pair.0
            }
        } else {
            if min > pair.0 {
                min = pair.0
            }
            if max < pair.1 {
                max = pair.1
            }
        }
    }
    return (min: min, max: max)
}


//let list/ = [1, 3, 0, 5, 9, -9, 11, 70, 100, 8 , 3]
print(findMinMaxV2(list: list))

protocol Foo {
    var a: Int {set get}
    func foo() -> Bool
}

extension Foo {
    var s: String {
        return "a string"
    }
}

class A: Foo {
    var a: Int = 0
    func foo() -> Bool {
        return false
    }
}

let f: Foo = A()
f.s
