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
    @IBOutlet weak var reChallengeButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var correct = 0
    var resultSound: AVAudioPlayer!
    
    let url = Bundle.main.bundleURL.appendingPathComponent("result.mp3")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(correct)問正解!"
        
        messeage()
        
        returnTopButton.layer.borderWidth = 2
        returnTopButton.layer.borderColor = UIColor.black.cgColor
        returnTopButton.layer.cornerRadius = 10.0
        
        reChallengeButton.layer.borderWidth = 2
        reChallengeButton.layer.borderColor = UIColor.black.cgColor
        reChallengeButton.layer.cornerRadius = 10.0
        
        do {
            try resultSound = AVAudioPlayer(contentsOf:url)
            //音楽をバッファに読み込んでおく
            resultSound.prepareToPlay()
        } catch {
            print(error)
        }
        resultSound.play()
    }
    
    //正当数に応じてメッセージを変えるメソッド
    func messeage() {
        if correct == 7 {
            messageLabel.text = "全問正解おめでとう！"
        } else if correct == 6 {
            messageLabel.text = "おしい！あと1問！"
        } else if correct == 5 {
            messageLabel.text = "たったの5か...ゴミめ"
        } else if correct == 4 {
            messageLabel.text = "そこそこ！"
        } else if correct == 3 {
            messageLabel.text = "微妙..."
        } else if correct == 2 {
            messageLabel.text = "頑張りましょう！"
        } else if correct == 1 {
            messageLabel.text = "たった一問正解でも未来はある"
        } else {
            messageLabel.text = "ドンマイ！"
        }
    }
    
    //もう一度挑戦するボタン押下された場合よばれるメソッド
    @IBAction func reChallengeButtonAction(_ sender: Any) {
        dismiss(animated: true)
        correct = 0
        
    }
    
    
    //スコア画面のトップに戻るボタンが押された場合に呼ばれるメソッド
    @IBAction func toTopButtonAction(_ sender: Any) {
        resultSound.stop()
        //スコア画面とレベル選択画面と問題画面の3つを閉じる処理
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }

}
