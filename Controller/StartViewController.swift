//
//  StartViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 8/7/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit
import CLTypingLabel

class StartViewController: UIViewController {
  
    // MARK: - Declerations

    var tm = TimerMethods()
    
    // Types "Study Buddy" on launch.
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    // Changes Label to reflect slider movement.
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var breakLabel: UILabel!
    
    
    // Access slider bar fields.
    @IBOutlet weak var studySlider: UISlider!
    @IBOutlet weak var breakSlider: UISlider!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = K.app_name
    }
    
    // Updates the study slider.
    @IBAction func studySliderChange(_ sender: UISlider) {
        let time = String(sender.value)
        studyLabel.text = "\(time) minutes"
    }
    
    // Updates the break slider.
    @IBAction func breakSliderChange(_ sender: UISlider) {
        let time = String(sender.value)
        breakLabel.text = "\(time) minutes"
    }
    
    // Gets values for timers and performs Segue
    @IBAction func startPressed(_ sender: UIButton) {
        let studyTime = Int(studySlider.value)
        let breakTime = Int(breakSlider.value)
        tm.setSession(s: studyTime, b: breakTime)
        
        self.performSegue(withIdentifier: "goToTimer", sender: self)
    }
    
    //MARK: - Segue Sequence
    
    // Perform segue and prepare new VC.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimer" {
            let destinationVC = segue.destination as! TimerViewController  // Changes the screen
            destinationVC.studyTimer = tm.getStudyTime()
            destinationVC.breakTimer = tm.getBreakTime()
        }
    }
}
