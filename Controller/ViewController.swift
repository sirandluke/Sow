//
//  ViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 8/7/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    @IBOutlet weak var startButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = K.app_name
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
}

