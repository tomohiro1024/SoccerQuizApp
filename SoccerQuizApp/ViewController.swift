//
//  ViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/03/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    var okSound: AVAudioPlayer!
    
    let url = Bundle.main.bundleURL.appendingPathComponent("okSound.mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.cornerRadius = 10.0
        
        do {
            try okSound = AVAudioPlayer(contentsOf:url)
            //音楽をバッファに読み込んでおく
            okSound.prepareToPlay()
        } catch {
            print(error)
        }
        
    }

    @IBAction func startButtonAction(_ sender: Any) {
        okSound.play()
    }
    
}

