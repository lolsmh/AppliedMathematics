import Foundation

func dychotomy(_ a: Double, _ b: Double, _ e: Double) {
    var startPoint = a
    var endPoint = b
    var previousSegmentLength = endPoint - startPoint
    let sigma = e/3
    var iterationCounter = 0
    var callCounter = 0
    var mid = (endPoint + startPoint) / 2
    print("Метод дихотомии:\n")
    
    while abs(endPoint - startPoint) > e {
        iterationCounter += 1
        let x1 = mid - sigma
        let x2 = mid + sigma
        if f(x1) > f(x2) {
            startPoint = x1
        }
        else {
            endPoint = x2
        }
        let currentSegmentLength = endPoint - startPoint
        print("\titeration: \(iterationCounter), startPoint: \(startPoint), endPoint: \(endPoint), length: \(currentSegmentLength) ratio: \(previousSegmentLength/(endPoint - startPoint))")
        previousSegmentLength = currentSegmentLength
        mid = (endPoint + startPoint) / 2
        callCounter += 2
    }
    print("\tf(\(mid)) = \(f(mid)), итераций: \(iterationCounter), вызовов f(x): \(callCounter)\n")
}
