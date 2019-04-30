

//func encrypt(word: String) -> String {
//    var list = word.map { String($0) }
//    guard let fAscii = list.first?.unicodeScalars.first?.value else {
//        return ""
//    }
//    list[0] = "\(fAscii)"
//
//    if list.count <= 2 {
//       return list.joined()
//    }
//    list.swapAt(1, list.endIndex - 1)
//    return list.joined()
//}
//
//
//func encryptThis(text:String) -> String{
//    var list = text.split(separator: " ").map {String($0)}
//    for (idx, val) in list.enumerated() {
//        let en = encrypt(word: String(val))
//        list[idx] = en
//    }
//    return list.joined(separator: " ")
//}

///-------Best
//func encryptThis(text:String) -> String {
//    return text
//        .split(separator: " ")
//        .map {
//            var a = $0.map { String($0) }
//            a[0] = String(a[0].unicodeScalars.first!.value)
//
//            if a.count > 2 {
//                a.swapAt(1, a.count-1)
//            }
//
//            return a.joined()
//        }
//        .joined(separator: " ")
//}
//
//
//
///*
// XCTAssertEqual(encryptThis(text: "A wise old owl lived in an oak"), "65 119esi 111dl 111lw 108dvei 105n 97n 111ka")
// XCTAssertEqual(encryptThis(text: "The more he saw the less he spoke"), "84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp")
// XCTAssertEqual(encryptThis(text: "The less he spoke the more he heard"), "84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare")
// XCTAssertEqual(encryptThis(text: "Why can we not all be like that wise old bird"), "87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri")
// XCTAssertEqual(encryptThis(text: "Thank you Piotr for all your help"), "84kanh 121uo 80roti 102ro 97ll 121ruo 104ple")
// */
//print(encryptThis(text: "The more he saw the less he spoke"))




/////----------------------------------------------------------------------------------------------------------------
/*
 
 class SolutionTest: XCTestCase {
 static var allTests = [
 ("testRecursiveReverseEmptyList", testRecursiveReverseEmptyList),
 ("testRecursiveReverseOneItem", testRecursiveReverseOneItem),
 ("testRecursiveReverseTwoItems", testRecursiveReverseTwoItems),
 ("testRecursiveReverseFiveItems", testRecursiveReverseFiveItems),
 ("testRecursiveReverseSeveralItems", testRecursiveReverseSeveralItems),
 ]
 
 func testRecursiveReverseEmptyList() {
 XCTAssertNil(recursiveReverse(list: nil))
 }
 
 func testRecursiveReverseOneItem() {
 let list:Node? = Node(2)
 XCTAssertTrue(linkedListsEqual(first: recursiveReverse(list: list), second: buildListFromArray([2])))
 }
 
 func testRecursiveReverseTwoItems() {
 let list:Node? = buildListFromArray([4, 9])
 XCTAssertTrue(linkedListsEqual(first: recursiveReverse(list: list), second: buildListFromArray([9, 4])))
 }
 
 func testRecursiveReverseFiveItems() {
 let list:Node? = buildListFromArray([2, 1, 3, 6, 5])
 XCTAssertTrue(linkedListsEqual(first: recursiveReverse(list: list), second: buildListFromArray([5, 6, 3, 1, 2])))
 }
 
 func testRecursiveReverseSeveralItems() {
 let list:Node? = buildListFromArray([9, 32, 4, 1, 35, 13, 41, 9, 42, 1, 7, 5, 4])
 XCTAssertTrue(linkedListsEqual(first: recursiveReverse(list: list), second: buildListFromArray(
 [4, 5, 7, 1, 42, 9, 41, 13, 35, 1, 4, 32, 9]))
 )
 }
 }
 
 XCTMain([
 testCase(SolutionTest.allTests)
 ])
 */


class Node {
    var data: Int
    var next: Node?
//    init(_ data: Int) {
//        self.data = data
//    }
    
    init?(_ values: Array<Int>) {
        var valuesCopy = values
        if valuesCopy.count == 0 {
            return nil
        }
        data = valuesCopy.removeFirst()
        next = Node(Array(valuesCopy))
    }
    
    public var description: String {
        var desc = String()
        var listRef : Node? = self
        while listRef != nil {
            desc += "\((listRef?.data)!) "
            listRef = listRef?.next
        }
        return desc
    }
}

extension Node {
    func reverse() -> Node?{
        
        // Iterate through each item, and reverse its link until you visit the last node in the list.
        // Once you reach the end, All items except the last one would have
        // their links reversed.
        var nextNode : Node? = self.next
        var prevNode : Node? = nil
        var currentNode : Node? = self
        
        while nextNode != nil{
            
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
            nextNode =  currentNode?.next
        }
        
        //Ensure the last item in the list too has its links reversed.
        currentNode?.next = prevNode
        
        return currentNode
        
    }
}

private(set) var head: Node?

var last: Node? {
    guard var node = head else {
        return nil
    }
    
    while let next = node.next {
        node = next
    }
    return node
}

func recursiveReverse(list:Node?) -> Node? {
    return list?.reverse()
}

let node = Node([1,3,5,6,11,45])
print(node?.description)

///--------->>>>>>>>>>>>>>>>>>>>>Another solution:
//func recursiveReverse(list: Node?) -> Node? {
//    guard let list = list else { return nil }
//    guard let next = list.next else { return list }
//
//    list.next = nil // Unlink to prevent cycles
//    let reversed = recursiveReverse(list: next)
//    next.next = list // Re-attach
//
//    return reversed
//}

