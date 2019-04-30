////: Playground - noun: a place where people can play
////https://medium.com/swift-programming/dependency-injection-with-the-cake-pattern-3cf87f9e97af
//import UIKit
//
//struct Product {
//    var name: String
//    var price: Double
//}
//
//protocol ProductsContainer {
//    func fetchProducts()->[Product]
//}
//
//struct ProductsContainerImplementation: ProductsContainer {
//    func fetchProducts() -> [Product] {
//        return [Product(name: "Adidas Sneakers", price: 2030.0), Product(name: "Nike Sneakers", price: 1000.0)]
//    }
//}
//
//protocol ProductsContainerInjectable {
//    var products: ProductsContainer {get}
//}
//
//extension ProductsContainerInjectable {
//    var products: ProductsContainer {
//        return ProductsContainerImplementation()
//    }
//}
//
//struct ProductViewModel: ProductsContainerInjectable {
//    init() {
//        self.products.fetchProducts().forEach {
//            print("Name Of Product:\($0.name)")
//        }
//    }
//}
//ProductViewModel()

//class A {
//    
//    class func getName() -> String {
//        return "I'm class A"
//    }
//    
//    func print() -> Void {
//        let a = type(of:self)
//        print(a.getName())
//    }
//}
//
//class B : A {
//    override class func getName() -> String {
//        return "I'm class B"
//    }
//}
//
//var b = B()
//b.print() //This line prints out "I'm class A"

import Foundation
//extension Array {
//    mutating func appends(condition: () -> Bool, _ val: Element) -> [Element] {
//        if condition() {
//            self.append(val)
//            return self
//        }
//        return self
//    }
//}

//func += <V> (left: inout [V], right: V) {
//    left.append(right)
//}

