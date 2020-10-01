//
//  OvverideUIModes.swift
//  Sow
//
//  Created by Luke Sirand on 10/1/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit
import CountableLabel

extension UIViewController {
    /// Handles CountableLabel cocoapod as they are not IOS 13 compatible
    func overrideCountableLabel(_ a: CountableLabel) {
        if self.traitCollection.userInterfaceStyle == .dark {
            return a.textColor = #colorLiteral(red: 0.9999127984, green: 1, blue: 0.9998814464, alpha: 1)
        } else {
            return a.textColor = #colorLiteral(red: 0.1186627522, green: 0.1185012832, blue: 0.1290718019, alpha: 1)
        }
    }
    
    /// Get the current time of the user to display time sensitive UI.
    /// @output: (UIColor of Background, UIColor of Labels)
    func SetStartUI() -> (UIColor, UIColor) {
        let currentDateTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDateTime)
        if (hour > 7 && hour < 18 ) {  // Day settings.
            return (#colorLiteral(red: 0.9560142159, green: 0.9558467269, blue: 0.9736434817, alpha: 1), #colorLiteral(red: 0.1186627522, green: 0.1185012832, blue: 0.1290718019, alpha: 1))
        }
        else {  // Night settings.
            return (#colorLiteral(red: 0.1186627522, green: 0.1185012832, blue: 0.1290718019, alpha: 1)   , #colorLiteral(red: 0.9560142159, green: 0.9558467269, blue: 0.9736434817, alpha: 1))
        }
    }
    
    func SetTimerUI() -> (UIColor, UIColor) {
        let currentDateTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDateTime)
        if (hour > 7 && hour < 18 ) {  // Day settings.
            return (#colorLiteral(red: 0.9999127984, green: 1, blue: 0.9998814464, alpha: 1), #colorLiteral(red: 0.1186627522, green: 0.1185012832, blue: 0.1290718019, alpha: 1))
        }
        else {  // Night settings.
            return (#colorLiteral(red: 0.2597192824, green: 0.2596027553, blue: 0.2688669562, alpha: 1)   , #colorLiteral(red: 0.9999127984, green: 1, blue: 0.9998814464, alpha: 1))
        }
    }
    
    
}
