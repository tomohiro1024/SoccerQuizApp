//
//  ScoreViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/03/20.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var returnTopButton: UIButton!
    
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(correct)問正解!"
        
        shareButton.layer.borderWidth = 2
        shareButton.layer.borderColor = UIColor.black.cgColor
        returnTopButton.layer.borderWidth = 2
        returnTopButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました。", "クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    
    //スコア画面のトップに戻るボタンが押された場合に呼ばれるメソッド
    @IBAction func toTopButtonAction(_ sender: Any) {
        //スコア画面とレベル選択画面と問題画面の3つを閉じる処理
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }

}
