//
//  NotificationHandler.swift
//  Sow
//
//  Created by Luke Sirand on 9/29/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

extension UIViewController {
    
    func studyNotif() {
        let content = UNMutableNotificationContent()
        content.title = K.N.sH
        content.body = K.N.sB
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0, repeats: false)
        let request = UNNotificationRequest(identifier: "studyNotif", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  nil)
    }
    
    func breakNotif() {
        let content = UNMutableNotificationContent()
        content.title = K.N.bH
        content.body = K.N.bB
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0, repeats: false)
        let request = UNNotificationRequest(identifier: "breakNotif", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  nil)
    }
}
