//
//  StartViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 8/7/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit
//import AVFoundation
import UserNotifications
import CLTypingLabel
import CountableLabel
import ViewAnimator


class StartViewController: UIViewController {

    /// MARK: - Declerations

    let debug = true
    
    //var player: AVAudioPlayer!

    var sm = StartMethods()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Changes Label to reflect slider movement.
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var sLeft: UILabel!
    @IBOutlet weak var breakLabel: UILabel!
    @IBOutlet weak var bLeft: UILabel!
    
    
    /// Access slider bar fields.
    @IBOutlet weak var studySlider: UISlider!
    @IBOutlet weak var breakSlider: UISlider!
    
    
    @IBOutlet weak var startButton: UIButton!

    // MARK: - Methods
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = K.app_name
        
        startButton.makeCircular()
        
        sLeft.text = "Study Time"
        bLeft.text = "Break Time"
        
        studySlider.value = Float(sm.getStudyTime())
        studyLabel.text = "\(sm.getBreakTime()) min"
        
        breakSlider.value = Float(sm.getBreakTime())
        breakLabel.text = "\(sm.getBreakTime()) min"
        
        /// Play App Launch Sound
        //let url = Bundle.main.url(forResource: K.S.n2_1, withExtension: K.S.ext)
        //player = try! AVAudioPlayer(contentsOf: url!)
        //player.play()
    }
    
    /// Updates the study slider.
    @IBAction func studySliderChange(_ sender: UISlider) {
        let time = String(Int(sender.value))
        
        studyLabel.text = "\(time) min"
    }
    
    /// Updates the break slider.
    @IBAction func breakSliderChange(_ sender: UISlider) {
        let time = String(Int(sender.value))
        breakLabel.text = "\(time) min"
    }
    
    /// Gets values for timers and performs Segue
    @IBAction func startPressed(_ sender: UIButton) {
        let studyTime = Int(studySlider.value)
        let breakTime = Int(breakSlider.value)
        sm.setSession(s: studyTime, b: breakTime)
        
        self.performSegue(withIdentifier: "goToTimer", sender: self)
    }
    
    //MARK: - Segue Sequence
    
    /// Perform segue and prepare new VC.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimer" {
            let destinationVC = segue.destination as! TimerViewController  // Changes the screen
            destinationVC.studyTimer = sm.getStudyTime()
            destinationVC.breakTimer = sm.getBreakTime()
        }
    }
}

//MARK: - Extensions

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

