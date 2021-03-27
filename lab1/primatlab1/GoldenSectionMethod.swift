import Foundation

func goldenSection(_ a: Double, _ b: Double, _ e: Double) {
    var startPoint: Double = a
    var endPoint: Double = b
    var x1: Double = startPoint + (3 - sqrt(5)) / 2 * (endPoint - startPoint)
    var x2: Double = startPoint + (sqrt(5) - 1) / 2 * (endPoint - startPoint)
    var interval = abs(endPoint - startPoint)
    var y1 = f(x1)
    var y2 = f(x1)
    var callCounter: Int = 2
    var iterationCounter: Int = 0
    while interval > e {
        iterationCounter += 1
        if y1 > y2 {
            startPoint = x1
            x1 = x2
            x2 = startPoint + (sqrt(5) - 1) / 2 * (endPoint - startPoint)
            y1 = y2
            y2 = f(x2)
            callCounter += 1
        } else {
            endPoint = x2
            x2 = x1
            x1 = startPoint + (3 - sqrt(5)) / 2 * (endPoint - startPoint)
            y2 = y1
            y1 = f(x1)
            callCounter += 1
        }
        interval = abs(endPoint - startPoint)
    }
    let result = (startPoint + endPoint) / 2
    print("\tf(\(result)) = \(f(result)), итераций: \(iterationCounter), вызовов f(x): \(callCounter)\n")
}
