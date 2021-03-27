import Foundation

func parabola(_ a: Double, _ b: Double, _ e: Double) {
    var x1 = a
    var x2 = 5.0
    var x3 = b
    var y1 = f(x1)
    var y2 = f(x2)
    var y3 = f(x3)
    var xm = b + e + 1
    var a1, a2, xm_prev, ym: Double
    var callCounter: Int = 3
    var iterationCounter: Int = 0
    repeat {
        iterationCounter += 1
        a1 = (y2 - y1) / (x2 - x1)
        a2 = 1 / (x3 - x2) * ((y3 - y1) / (x3 - x1) - a1)
        xm_prev = xm
        xm = 1 / 2 * (x1 + x2 - a1 / a2)
        ym = f(xm)
        callCounter += 1
        if (x1 < xm && xm < x2 && x2 < x3) {
            if (ym >= y2) {
                x1 = xm
                y1 = ym
            } else {
                x3 = x2
                y3 = y2
                x2 = xm
                y2 = ym
            }
        } else {
            if (y2 >= ym) {
                x1 = x2
                y1 = y2
                x2 = xm
                y2 = ym
            } else {
                x3 = xm
                y3 = ym
            }
        }
    } while abs(xm - xm_prev) > e
    
    print("Парабола: f(\(xm)) = \(f(xm)), итераций: \(iterationCounter), вызовов f(x): \(callCounter)")
}
