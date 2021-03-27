
import Foundation

func fibonacci(_ a: Double, _ b: Double, _ e: Double) {
    
    func getFibonacciNumber(_ number: Int) -> Double {
        round( pow((1 + sqrt(5)) / 2, Double(number)) - pow((1 - sqrt(5)) / 2, Double(number)) / sqrt(5) )
    }
    var n = 1
    while getFibonacciNumber(n + 2) <= (b - a) / e {
        n += 1
    }
    var startPoint = a
    var endPoint = b
    var x1 = startPoint + getFibonacciNumber(n) / getFibonacciNumber(n + 2) * (endPoint - startPoint)
    var x2 = startPoint + getFibonacciNumber(n + 1) / getFibonacciNumber(n + 2) * (endPoint - startPoint)
    var y1 = f(x1)
    var y2 = f(x2)
    var callCounter: Int = 2
    var iterationCounter: Int = 0    
    while (endPoint - startPoint > e && startPoint < endPoint) {
        iterationCounter += 1
        if (y1 > y2) {
            n -= 1
            startPoint = x1
            x1 = x2
            x2 = startPoint + getFibonacciNumber(n + 1) / getFibonacciNumber(n + 2) * (endPoint - startPoint)
            y1 = y2
            y2 = f(x2)
            callCounter += 1
        } else {
            n -= 1
            endPoint = x2
            x2 = x1
            x1 = startPoint + getFibonacciNumber(n) / getFibonacciNumber(n + 2) * (endPoint - startPoint)
            y2 = y1
            y1 = f(x1)
            callCounter += 1
        }
    }
    
    let result = (startPoint + endPoint) / 2
    
    print("Фибоначчи: f(\(result)) = \(f(result)), итераций: \(iterationCounter), вызовов f(x): \(callCounter)")
}
