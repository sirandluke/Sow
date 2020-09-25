//
//  TimerViewController.swift
//  StudyBuddy
//
//  Created by Luke Sirand on 9/22/20.
//  Copyright © 2020 Luke Sirand. All rights reserved.
//

// TODO: Make the ":" flash on and off like digital alarm clock
//       Change the label to be of format MM:SS
//       Transfer methods to TimerMethods.swift


import UIKit
import AVFoundation
import CLTypingLabel
import CountableLabel

class TimerViewController: UIViewController {

    //MARK: - Declerations
    let debug = true
    
    var tm = TimerMethods()
    
    var player: AVAudioPlayer?
    
    // Declare timer
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    // Stores the study and break times user specified
    var studyTimer: Int?
    var breakTimer: Int?
    
    // TODO: create action and outlets for timers and labels
    @IBOutlet weak var activityLabel: CLTypingLabel!
    @IBOutlet weak var timeLabel: CountableLabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if debug {
            print("Study time: \(String(describing: studyTimer))")
            print("Break time: \(String(describing: breakTimer))")
        }
        tm.setClock(studyTimer!, breakTimer!, false)
        buttonLabel.makeCircular()
        startTime()
    }
    
    // For when user swipes out of view.
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @objc func startTime() {
        timer.invalidate() // Reset timer.
        
        totalTime = studyTimer!
        
        // Reset
        reset()
        
        // timeInterval: 1.0 -> want to update every second
        // repeats -> make it repeat
        // selector -> calls function everysingle second (updateTimer)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Update the countdown timer or switch timers.
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = tm.progressBar(secondsPassed)
            timeLabel.text = tm.getTime(secondsPassed)
            if debug {
                print(tm.progressBar(secondsPassed))
            }
        }
        else {
            timer.invalidate()
            if (tm.c?.status)! {  // Gets audio sample.
                // TODO: Text Message Notify User
                let url = Bundle.main.url(forResource: "notification_1", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
            }
            else {
                let url = Bundle.main.url(forResource: "notification_2", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
            }
            player!.play()
            reset()
            tm.changeStatus()
        }
    }
    
    // Reset timer.
    func reset() {
        progressBar.progress = 1.0
        secondsPassed = 0
        activityLabel.text = tm.getPhrase()
        totalTime = tm.reset()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if debug {
            print("Back button pressed.")
        }
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
}
