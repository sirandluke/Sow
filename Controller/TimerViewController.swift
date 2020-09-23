//
//  TimerViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 9/22/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

// TODO: Make the ":" flash on and off like digital alarm clock


import UIKit
import AVFoundation
import CLTypingLabel

class TimerViewController: UIViewController {

    //MARK: - Declerations
    let debug = true
    
    var player: AVAudioPlayer?
    
    // Declare timer
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    // Stores the study and break times user specified
    var studyTimer: Int?
    var breakTimer: Int?

    var breakStatus: Bool? // Indicates when studying or taking a break.
    
    // TODO: create action and outlets for timers and labels
    @IBOutlet weak var activityLabel: CLTypingLabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var seperatorLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        breakStatus = false
        activityLabel.text = K.Phrases.s[1]
        
    }
    
    // Returns user to Start Page.
    @IBAction func backButton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @objc func startTime() {
        
    }
    
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            if debug {
                print(Float(secondsPassed) / Float(totalTime))
            }
        }
        else {
            timer.invalidate()
            if breakStatus! {
                // TODO: Text Message Notify User
                activityLabel.text = K.Phrases.b[1]
                let url = Bundle.main.url(forResource: "notification_1", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player!.play()
                breakStatus = false
            }
            else {
                activityLabel.text = K.Phrases.s[1]
                let url = Bundle.main.url(forResource: "notification_2", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player!.play()
                breakStatus = true
            }
        }
    }
}
