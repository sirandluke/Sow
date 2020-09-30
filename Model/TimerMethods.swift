//
//  TimerMethods.swift
//  Sow
//
//  Created by Luke Sirand on 9/23/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit

struct TimerMethods {
    
    let debug = false
    
    var c: Clock?
    
    mutating func setClock (_ s: Int, _ b: Int, _ status: Bool) {
        c = Clock(s: s, b: b, status: status)
    }
    
    func progressBar(_ secondsPassed: Int) -> Float {
        if c!.status {
            return 1.0 - Float(secondsPassed) / Float(c!.b * 60)

        }
        else {
            return 1.0 - Float(secondsPassed) / Float(c!.s * 60)
        }
    }
    
    /// Formats time as 'MM:SS'.
    func getTime(_ secondsPassed: Int) -> String {
        var t = c!.s
        if c!.status {
            t = c!.b
        }
        
        let newT = (t * 60) - secondsPassed
        let m = (newT / 60 )
        let s = (newT % 60)
        var mStr = String(m)
        var sStr = String(s)
        if m < 10 {
            mStr = "0\(m)"
        }
        if s < 10 {
            sStr = "0\(s)"
        }
        if debug {
            if debug {
                print("The status is: \(c!.status)")
                print("Seconds passed is: \(secondsPassed)")
                print("Total time is: \(t)")
                print("m: \(m), s: \(s)")
                print("\(mStr):\(sStr)")
            }
        }
        
        return "\(mStr):\(sStr)"
    }
    
    /// Indicates switching timers.
    mutating func changeStatus() {
        if c!.status { c!.status = false }
        else { c!.status = true }
    }
    
    mutating func reset() -> Int {
        var totalTime = c!.s
        if c!.status {
             totalTime = c!.b
        }
        return totalTime
    }
    
    /// Picks a random phrase to be displayed.
    func getPhrase() -> String {
        if c!.status {
            return K.P.b[Int.random(in: 0..<K.P.b.count)]
        }
        return K.P.s[Int.random(in: 0..<K.P.s.count)]
    }
}
