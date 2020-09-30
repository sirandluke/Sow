//
//  TimerViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 9/22/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

import UIKit
import AVFoundation
import UserNotifications
import CLTypingLabel
import CountableLabel

class TimerViewController: UIViewController {

    //MARK: - Declerations
    let debug = true
    
    
    var tm = TimerMethods()
    
    var player: AVAudioPlayer!
    
    /// Declare timer
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var isPaused = false
    
    /// Stores the study and break times user specified
    var studyTimer: Int?
    var breakTimer: Int?
    
    /// TODO: create action and outlets for timers and labels
    @IBOutlet weak var activityLabel: CLTypingLabel!
    @IBOutlet weak var timeLabel: CountableLabel!
    @IBOutlet weak var pauseStartLabel: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseStartLabel.titleLabel?.text = K.p
        pauseStartLabel.makeCircular()
        if debug {
            tm.setClock(studyTimer!, breakTimer!, isPaused)
            print("Study time: \(String(describing: studyTimer))")
            print("Break time: \(String(describing: breakTimer))")
        }
        activityLabel.text = tm.getPhrase()
        startTime()
    }
 
    /// For when user swipes out of view.
    override func viewDidDisappear(_ animated: Bool) {
        if !(isPaused) {
            timer.invalidate()
        }
    }
    
    @objc func startTime() {
        timer.invalidate()
        totalTime = studyTimer!
        
        /// Reset
        reset()
        
        /// timeInterval: 1.0 -> want to update every second
        /// repeats -> make it repeat
        /// selector -> calls function everysingle second (updateTimer)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    /// Update the countdown timer or switch timers.
    @objc func updateTimer() {
        if secondsPassed < totalTime * 60 {
            secondsPassed += 1
            progressBar.progress = tm.progressBar(secondsPassed)
            timeLabel.text = tm.getTime(secondsPassed)
            if debug {
                print(tm.progressBar((secondsPassed)))
            }
        }
        else {
            /// Gets audio sample.
            if (tm.c?.status)! {  /// Switching from break to study
                let url = Bundle.main.url(forResource: K.S.n1_2, withExtension: K.S.ext)
                player = try! AVAudioPlayer(contentsOf: url!)
                studyNotif()
            }
            else { /// Switching from study to break
                let url = Bundle.main.url(forResource: K.S.n1_1, withExtension: K.S.ext)
                player = try! AVAudioPlayer(contentsOf: url!)
                breakNotif()
            }
            self.player!.play()
            reset()
            rUI()
        }
    }
    
    /// Reset timer.
    func reset() {
        progressBar.progress = 1.0
        secondsPassed = 0
        totalTime = tm.reset()
    }
    
    /// Updates UI
    func rUI() {
        tm.changeStatus()
        activityLabel.text = tm.getPhrase()
    }
        
        /// Toggle pause/start
    @IBAction func pauseStartPressed(_ sender: UIButton) {
        if debug {
            print("Button Pressed")
        }
        if isPaused {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPaused = false
            pauseStartLabel.titleLabel?.text = K.p
        }
        else {
            timer.invalidate()
            isPaused = true
            pauseStartLabel.titleLabel?.text = K.s
        }
    }
}
