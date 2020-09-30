//
//  Alerts.swift
//  Sow
//
//  Created by Luke Sirand on 9/28/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, handlerOK: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it!", style: .cancel, handler: handlerOK)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
