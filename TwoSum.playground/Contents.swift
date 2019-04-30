//func findListSum(list: [Int], n: Int) -> [(Int, Int)] {
//    var result = [(Int, Int)]()
//    var d = [Int: Int]()
//    for val in list {
//        let minus = n - val
//        if d[val] == minus {
//            result.append((val, minus))
//        } else {
//            d[minus] = val
//        }
//    }
//    return result
//}
//
//let l = [-1, -2, -5, 0, 13, 5, 6, 7, -12]
//let r = findListSum(list: l, n: 5)
//print(r)


//F0= 0
//F1 = 1
//Fn = Fn-1 + Fn-2

//func fibonaci(n: Int) -> [Int] {
////    var result = [Int]()
////
////    for i in 0 ..< n {
////        if i < 2 {
////            result.append(i)
////            continue
////        }
////        let val = result[i-1] + result[i-2]
////        result.append(val)
////    }
////    return result
//    var x = -1 ,y = 1, sum = 0;
//    var result = [Int]()
//    for _ in 0..<10 {
//
//        sum = x+y;
//        x   = y;
//        y   = sum;
//
//        result.append(sum)
//
//    }
//    return result
//}

//print(fibonaci(n: 8))


/*
 câu 4:cho chuỗi chỉ chứa {} [] ()
 ví dụ
 {[(())]}[]()
 
 tìm chuỗi tag nào cân bằng mà dài nhất
 tag cân bằng là có đóng và mở
 */

//import Foundation

//
//func ~=<T: Equatable>(pattern: [T], value: T) -> Bool {
//    return pattern.contains(value)
//}
//
//func findMaxString(string: String) -> String {
//    let openChars: [Character] = ["{", "[", "("]
//    let closeChars: [Character] = ["}", "]", ")"]
//    var stacks = [Character]()
//    var findStrings = [String]()
//    var index = 0
//    var copyStr = string
//    for char in copyStr {
//        switch char {
//        case openChars:
//            stacks.append(char)
//            index += 1
//        case closeChars:
//            if !stacks.isEmpty {
////                if (stacks.last == "(" && char == ")" ||
////                    stacks.last == "{" && char == "}" ||
////                    stacks.last == "[" && char == "]") {
////                }
//                index += 1
//                stacks.removeLast()
//            } else if index == 0 {
//                copyStr.removeFirst()
//                continue
//            }
//        default:
//            print("")
//        }
//        if index != 0 && stacks.isEmpty {
//            let idx = copyStr.index(copyStr.startIndex, offsetBy: index)
//            let str = copyStr.prefix(upTo: idx)
//            copyStr = String(copyStr[str.endIndex...])
//            findStrings.append(String(str))
//            index = 0
//        }
//    }
//    return findStrings.max(by: { (a, b) -> Bool in
//        return a.count < b.count
//    }) ?? ""
//}
//
//let str = "{}){{[[[[((()))]]]]}{[(())]})[[]()"
//let r = findMaxString(string: str)
//print(r)
//let isRight = "{[[[[((()))]]]]}" == r
//print("result is :\(isRight)")


