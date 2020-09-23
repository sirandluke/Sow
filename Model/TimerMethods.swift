//
//  TimerMethods.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 9/22/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit

struct TimerMethods {
    
    var session: Session?
    
    
    mutating func setSession(s: Int, b: Int) {
        session = Session(sTime: s, bTime: b)
    }
    
    // Returns the time user selected or default time of 30 minutes
    func getStudyTime() -> Int {
        return session?.sTime ?? 30
    }
    
    // Returns the time user selected or default time of 10 minutes
    func getBreakTime() -> Int {
        return session?.bTime ?? 10
    }
    
}
