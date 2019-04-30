////////func find(list: [Int], total: Int) -> (Int?, Int?) {
////////    var dict = [Int: Int]()
////////    for (idx, val) in list.enumerated() {
////////        let a = total - val
////////        if dict[a] != nil {
////////            return (a, val)
////////        }
////////        dict[val] = idx
////////    }
////////    return (nil, nil)
////////}
////////
////////let list = [1, 3, 5, 17, 7]
////////let result = find(list: list, total: 10)
////////print(result)
//////
//////
////////------------------------------------------------------------------------
///////*
//////Two tortoises named A and B must run a race. A starts with an average speed of 720 feet per hour. Young B knows she runs faster than A, and furthermore has not finished her cabbage.
//////
//////When she starts, at last, she can see that A has a 70 feet lead but B's speed is 850 feet per hour. How long will it take B to catch A?
//////
//////More generally: given two speeds v1 (A's speed, integer > 0) and v2 (B's speed, integer > 0) and a lead g (integer > 0) how long will it take B to catch A?
//////
//////The result will be an array [hour, min, sec] which is the time needed in hours, minutes and seconds (round down to the nearest second) or a string in some languages.
//////
//////If v1 >= v2 then return nil, nothing, null, None or {-1, -1, -1} for C++, C, Go, Nim, [] for Kotlin or "-1 -1 -1".
//////
//////Examples:
//////(form of the result depends on the language)
//////
//////race(720, 850, 70) => [0, 32, 18] or "0 32 18"
//////race(80, 91, 37)   => [3, 21, 49] or "3 21 49"
//////** Note:
//////
//////See other examples in "Your test cases".
//////
//////In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.
//////
//////** Hints for people who don't know how to convert to hours, minutes, seconds:
//////
//////Tortoises don't care about fractions of seconds
//////
//////Think of calculation by hand using only integers (in your code use or simulate integer division)
//////
//////or Google: "convert decimal time to hours minutes seconds"
//////
//////
////// ///
//////
//////
////// import XCTest
////// import Glibc // for random()
//////
////// // XCTest Spec Example:
////// // TODO: replace with your own tests (TDD), these are just how-to examples to get you started
//////
////// class SolutionTest: XCTestCase {
////// static var allTests = [
////// ("race", testExample),
////// ]
//////
////// func testing(_ v1: Int, _ v2: Int, _ g: Int, _ expected: [Int]?) {
////// XCTAssert(race(v1, v2, g)! == expected!, "should return \(expected!)")
////// }
////// func testingNil(_ v1: Int, _ v2: Int, _ g: Int) {
////// XCTAssertTrue(race(v1, v2, g) == nil, "Should return nil")
////// }
//////
////// func testExample() {
////// testing(720, 850, 70, [0, 32, 18])
////// testing(80, 91, 37, [3, 21, 49])
////// testing(80, 100, 40, [2, 0, 0])
////// testing(720, 850, 37, [0, 17, 4])
////// testingNil(820, 81, 550)
////// }
//////
////// }
//////
////// XCTMain([
////// testCase(SolutionTest.allTests)
////// ])
//////*/
//////
//////import Foundation
//////
////////func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
////////    let sec = (seconds % 3600) % 60
////////    print("--->\(sec)")
////////    if sec >= 58 {
////////        return (seconds / 3600, (seconds % 3600) / 60 + 1, 0)
////////    }
////////    return (seconds / 3600, (seconds % 3600) / 60, sec)
////////}
//////
//////func secondsToHoursMinutesSeconds (seconds : Double) -> (Double, Double, Double) {
//////    let (hr,  minf) = modf (seconds / 3600)
//////    let (min, secf) = modf (60 * minf)
//////    print(secf)
//////    if secf >= 0.9 {
//////       return (hr, min + 1, 0)
//////    }
//////    print("----->D:\(60 * secf)----->\(Int((60 * secf + 0.00001)))")
//////    return (hr, min, 60 * secf)
//////}
//////
//////func race(v1: Int, v2: Int, g: Int) -> [Int]? {
//////    if v1 > v2 {
//////        return nil
//////    }
//////    let timeInHours: Double = Double(g) / Double(v2 - v1)
//////    print(timeInHours)
//////    let result = secondsToHoursMinutesSeconds(seconds: Double(timeInHours*3600))
//////    return [Int(result.0), Int(result.1), Int(result.2 + 0.00001)]
//////}
//////
////////testing(720, 850, 70, [0, 32, 18])
////////testing(80, 91, 37, [3, 21, 49])
////////print(race(v1: 720, v2: 850, g: 70))
////////print(race(v1: 80, v2:91, g: 37))
//////
////////testing(80, 100, 40, [2, 0, 0])
////////print(race(v1: 80, v2:91, g: 37))//[3, 21, 49]
////////testing(80, 91, 37, [3, 21, 49])
//////print(race(v1: 80, v2: 110, g: 130))
//////
//////
//////print(race(v1: 720, v2: 855, g: 105))
//////struct Chit {
//////    let m: String?
//////}
//////struct Child {
//////    let ch: String
//////    let c: Chit
//////}
//////struct Foo {
//////    let a: Int
//////    let b: String
//////    let c: Child
//////}
//////
//////let chit = Chit(m: nil)
//////let child = Child(ch: "child string", c: chit)
//////
//////let fo = Foo(a: 19, b: "a String", c: child)
//////
//////let reflect = Mirror(reflecting: fo)
//////
//////for _c in reflect.children {
//////    print("CHILD IS:\(_c.label!)")
//////    print("CHILD IS:\(_c.value)")
//////}
//////
//////class ClassFoo {
//////    let a: String?
//////    let b: Int
//////    init(a: String?, b: Int) {
//////        self.a = a
//////        self.b = b
//////    }
//////}
////
//////let cl = ClassFoo(a: "a strn", b: 11)
//////
//////let ref = Mirror(reflecting: cl)
//////
//////for _c in reflect.children {
//////    print("CL IS:\(_c.label!)")
//////    print("CL IS:\(_c.value)")
//////}
////
////
//////let dictA: [String: Any] = ["DA1": "String", "DA2": 11]
//////
//////let ref = Mirror(reflecting: dictA)
//////for _c in ref.children {
//////    print("CL IS:\(_c.label)")
//////    print("CL IS:\(_c.value)")
//////}
//////
//////let dictB: [AnyHashable: Any] = ["DA1": "String", 10 : 11]
//////
//////let ref2 = Mirror(reflecting: dictB)
//////for _c in ref2.children {
//////    print("CL2 IS:\(_c.label)")
//////    print("CL2 IS:\(_c.value)")
//////}
//////import Foundation
//////
//////@objc protocol FooProtocol {
//////    var screenName: String {get set}
//////    var flowID: NSNumber{get}
//////    func update(screenName: String, flowId: NSNumber)
//////}
//////@objcMembers
//////class Foo: NSObject, FooProtocol {
//////    var screenName: String
//////    var flowID: NSNumber
//////
//////    init(scre: String, fl: NSNumber) {
//////        self.screenName = scre
//////        self.flowID = fl
//////    }
//////    func update(screenName: String, flowId: NSNumber) {
//////        self.screenName = screenName
//////        self.flowID = flowId
//////    }
//////}
//////
//////class Helper {
//////    static func TrackSomething(f: inout FooProtocol, fliD: Int) {
//////        f.update(screenName: "Screen2", flowId: NSNumber(value: fliD))
//////    }
//////
//////    static func trackingScreen(f: inout FooProtocol) {
//////        f.screenName = "screen3"
//////    }
//////}
//////
//////
//////class A {
//////    var foo:FooProtocol = Foo(scre: "Screen1", fl: 1)
//////    func doSomething() {
//////        Helper.TrackSomething(f: &foo, fliD: 2)
//////    }
//////
//////    func trackScreen() {
//////        Helper.trackingScreen(f: &foo)
//////    }
//////
//////}
//////
//////let a = A()
//////print("FlowID:\(a.foo.flowID)--Screen:\(a.foo.screenName)")
//////a.doSomething()
//////print("FlowID:\(a.foo.flowID)--Screen:\(a.foo.screenName)")
//////a.trackScreen()
//////print("FlowID:\(a.foo.flowID)--Screen:\(a.foo.screenName)")
////
////protocol FooProtocol {
////    var a: String{get set}
////}
////
////class Foo: FooProtocol {
////    var a: String
////    init(a: String) {
////        self.a = a
////    }
////}
////
////func update(foo: inout FooProtocol) {
////    foo.a = "new string"
////}
////
////class AAAA {
////var f: FooProtocol = Foo(a: "First String")
////    func updateA() {
////        update(foo: &self.f)
////        print(f.a)
////    }
////}
////
////let aa = AAAA()
////aa.updateA()
//
//
//import UIKit
//
//class ParentVC: UIViewController {
//    lazy var button: UIButton = {
//        let b = UIButton(frame: CGRect.zero)
//        b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return b
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(button)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("ParentVC-viewWillAppear")
//    }
//
//    @objc func buttonAction() {
//        print("ParentVC-->buttonActionTap")
//        checkOTP()
//    }
//
//    func checkOTP() {
//        if randomNumber() % 2 == 0{
////            trackEventAnalytic(111111)
//            trackEventNumber()
//        } else {
////            trackEventAnalytic(33333)
//            trackOddNumber()
//        }
//    }
//
//    func trackOddNumber(){
//        trackEventAnalytic(33333)
//    }
//
//    func trackEventNumber() {
//        trackEventAnalytic(111111)
//    }
//
//    func randomNumber() -> Int {
//       return Int.random(in: 0 ... 10)
//    }
//
//    func trackEventAnalytic(_ eventId: Int) {
//        print("---->ParentVC-trackEventAnalytic:\(eventId)")
//    }
//
//}
//
//class ChildVC: ParentVC {
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("ChildVC-viewWillAppear")
//    }
//
//    override func trackEventAnalytic(_ eventId: Int) {
//        //print result: ChildVC:trackEventAnalytic---->111111
//        //How to pass eventId with value 2222 instate of 111111
//        print("ChildVC:trackEventAnalytic---->\(eventId)")
////        super.trackEventAnalytic(eventId)
//    }
//
//    override func trackOddNumber() {
//        trackEventAnalytic(2222222222222)
//    }
//
//    override func trackEventNumber() {
//        trackEventAnalytic(22)
//    }
//}
//
////let c = ChildVC()
////c.button.sendActions(for: .touchUpInside)
//
//let p = ParentVC()
//p.button.sendActions(for: .touchUpInside)
//
//let view = UIViewController()
//view.view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//view.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//p.present(view, animated: true, completion: nil)
//#if compiler(>=5.0)
//import UIKit
//#else
//print("--->")
//import Foundation
//#endif


//protocol Foo1 {
//    var a: String?{get}
//    func abc() -> String
//}
//
//protocol Foo2 {
//    var b: Int {get}
//    func xyz()
//}
//
//typealias E = Foo1 & Foo2
//var f: E?
//
//print("---->\(f?.a)")


//KEY PATH
//class DebugPrinter<T> where T: AnyObject {
//    /// 1
//    var keyPaths: [(String?, KeyPath<T, Any?>)] = []
//    let reference: T
//    let prefix: String
//
//    /// 2
//    init(_ prefixString: String, for instance: T) {
//        reference = instance
//        prefix = prefixString
//    }
//
//    /// 3
//    func addLog(_ path: KeyPath<T, Any?>, prefix: String? = nil) {
//        keyPaths.append((prefix, path))
//    }
//
//    /// 4
//    func log() {
//        print(prefix, terminator: ": ")
//        for entry in keyPaths {
//            if let prefix = entry.0 {
//                print(prefix, terminator: "")
//            }
//            print(reference[keyPath: entry.1], terminator: ", ")
//        }
//    }
//}

//class DebugPrinter<T> where T: AnyObject {
//    var keyPaths: [(String?, PartialKeyPath<T>)] = []
//    let reference: T
//    let prefix: String
//
//    init(_ prefixString: String, for instance: T) {
//        reference = instance
//        prefix = prefixString
//    }
//
//    func addLog(_ path: PartialKeyPath<T>, prefix: String? = nil) {
//        keyPaths.append((prefix, path))
//    }
//
//    func log() {
//        print(prefix, terminator: ": ")
//        for entry in keyPaths {
//            if let prefix = entry.0 { print(prefix, terminator: "") }
//            print(reference[keyPath: entry.1], terminator: ", ")
//        }
//    }
//}
//
//import UIKit
//
//class Presentation {
//    class Slide {
//        var name: String?
//        var number: Int?
//        var backgroundColor: UIColor?
//        var content: String?
//        var leftImage: UIImage?
//        var rightImage: UIImage?
//    }
//    var currentSlide: Slide?
//    var currentSlideIndex: Int?
//    var slides: [Slide]?
//    var title: String?
//    var startedPresenting: Date?
//    var isAnimating: Bool?
//}
//
//
//let state = Presentation() // we need a presentation instance
//let printer = DebugPrinter("State", for: state)
//printer.addLog(\Presentation.currentSlideIndex, prefix: "Current-")
//printer.addLog(\Presentation.currentSlide?.name)
//
//printer.log()
import Foundation
import UIKit
let osVersion = UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "_", options: .literal, range: nil)
print(osVersion)
