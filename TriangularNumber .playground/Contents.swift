
import Foundation

func TriangularNumber(n: Int) -> Bool {
    let detal: Double = Double(8*n + 1)
    let x = (detal.squareRoot() - 1)/2
    if floor(x) == x {
        return true
    }
    return false
}

let f = TriangularNumber

print(f(10))
print(f(91))
