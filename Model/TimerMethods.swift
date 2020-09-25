//
//  TimerMethods.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 9/23/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit

struct TimerMethods {
    
    var c: Clock?
    
    mutating func setClock (_ s: Int, _ b: Int, _ status: Bool) {
        c = Clock(s: s, b: b, status: status)
    }
    
    func progressBar(_ secondsPassed: Int) -> Float {
        if c!.status {
            return 1.0 - Float(secondsPassed) / Float(c!.b)

        }
        else {
            return 1.0 - Float(secondsPassed) / Float(c!.s)
        }
    }
    
    // Formats time as 'MM:SS'.
    func getTime(_ secondsPassed: Int) -> String {
        var t = c!.s
        if c!.status {
            t = c!.b
        }
        
        let newT = t - secondsPassed
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
        return "\(mStr):\(sStr)"
    }
    
    // Indicates switching timers.
    mutating func changeStatus() {
        if c!.status { c!.status = false }
        else { c!.status = true }
    }
    
    // Picks a random phrase to be displayed
    func getPhrase() -> String {
        if c!.status {
             return K.Phrases.b[Int.random(in: 0..<K.Phrases.b.count)]
        }
        return K.Phrases.s[Int.random(in: 0..<K.Phrases.s.count)]
    }
}
