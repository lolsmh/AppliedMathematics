//
//  BrentMethod.swift
//  primatlab1
//
//  Created by Даниил Апальков on 27.03.2021.
//

import Foundation

func brent(_ a: Double, _ b: Double, _ e: Double) {
    var startPoint = a
    var endPoint = b
    let r = (3 - sqrt(5)) / 2
    var currentD = endPoint - startPoint
    var previousD = currentD
    var x = startPoint + r * (endPoint - startPoint)
    var w = x
    var v = x
    var yx = f(x)
    var yw = yx
    var yv = yw
    var g, u, a1, a2: Double
    var callCounter: Int = 1
    var iterationCounter: Int = 0
    while true {
        iterationCounter += 1
        if (max(x - startPoint, endPoint - x) < e) {
            print("Брент: f(\(x)) = \(f(x)), итераций: \(iterationCounter), вызовов f(x): \(callCounter)\n")
            break
        }
        g = previousD / 2
        previousD = currentD
        
        a1 = (yw - yx) / (w - x)
        a2 = 1 / (v - w) * ((yv - yx) / (v - x) - a1)
        u = 1/2 * (x + w - a1 / a2)
        var yu = f(u)
        callCounter += 1
        
        if (u.isNaN || (u < startPoint || u > endPoint) || abs(u - x) > g) {
            if (x < (startPoint + endPoint) / 2) {
                u = x + r * (endPoint - x)
                previousD = endPoint - x
            } else {
                u = x - r * (x - startPoint)
                previousD = x - startPoint
            }
            yu = f(u)
            callCounter += 1
        }
        currentD = abs(u - x)
        if (yu > yx) {
            if (u < x) {
                startPoint = u
            } else {
                endPoint = u
            }
            
            if (yu <= yw || w == x) {
                v = w
                yv = yw
                w = u
                yw = yu
            } else {
                if (yu < yv || v == x || v == w) {
                    v = u
                    yv = yu
                }
            }
        } else {
            if (u < x) {
                endPoint = x
            } else {
                startPoint = x
            }
            v = w
            yv = yw
            w = x
            yw = yx
            x = u
            yx = yu
        }
    }
}
