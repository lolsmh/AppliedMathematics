import Foundation

func test(_ a: Double, _ b: Double, _ e: Double) {
    dychotomy(a, b, e)
    goldenSection(a, b, e)
    fibonacci(a, b, e)
    parabola(a, b, e)
    brent(a, b, e)
}

test(0, 16, 0.00001)

