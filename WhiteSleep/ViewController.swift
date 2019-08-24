//
//  ViewController.swift
//  WhiteSleep
//
//  Created by an vu on 8/24/19.
//  Copyright © 2019 an vu. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    var timer: Timer?
    var timeLeft = 0 {
        didSet {
            let hour = timeLeft/3600
            let minute = timeLeft%3600/60
            let second = timeLeft%60
            timeLeftLabel.text = (hour==0) ? String(format: "%02d:%02d", minute,second) : String(format: "%02d:%02d:%02d", hour,minute,second)
        }
    }

    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.url(forResource: "ShushingBabyShort", withExtension: "mp3")!
        timeLeft = 0
        timerSlider.minimumValue = 1
        timerSlider.maximumValue = Float(TimeArray.range.count)
        try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .allowAirPlay)
        try! AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        try! player = AVAudioPlayer(contentsOf: path)
        player.numberOfLoops = -1
        // Do any additional setup after loading the view.
    }

    func timeUpdate(){
        timeLeft -= 1
        if timeLeft <= 0 {
            timer?.invalidate()
            player.pause()
        }
    }
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [weak self]
            timer in
            self?.timeUpdate()
        }
    }
    @IBAction func timerChange(_ sender: UISlider) {
        player.pause()
        timer?.invalidate()
        timeLeft =  TimeArray.range[Int(sender.value)-1]
        
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        player.pause()
        timer?.invalidate()
    }
    @IBAction func stopPressed(_ sender: Any) {
        player.stop()
        timer?.invalidate()
    }
    @IBAction func playPressed(_ sender: Any) {
        player.play()
        startTimer()
    }
    @IBAction func valueChanged(_ sender: UISlider) {
        player.volume = sender.value
    }
    
}

