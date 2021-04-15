//
//  ScoreViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/03/20.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var returnTopButton: UIButton!
    
    var correct = 0
    var resultSound: AVAudioPlayer!
    
    let url = Bundle.main.bundleURL.appendingPathComponent("resultSound.mp3")

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(correct)問正解!"
        
        returnTopButton.layer.borderWidth = 2
        returnTopButton.layer.borderColor = UIColor.black.cgColor
        
        do {
            try resultSound = AVAudioPlayer(contentsOf:url)
            //音楽をバッファに読み込んでおく
            resultSound.prepareToPlay()
        } catch {
            print(error)
        }
        resultSound.play()
    }
    
    
    //スコア画面のトップに戻るボタンが押された場合に呼ばれるメソッド
    @IBAction func toTopButtonAction(_ sender: Any) {
        resultSound.stop()
        //スコア画面とレベル選択画面と問題画面の3つを閉じる処理
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }

}
