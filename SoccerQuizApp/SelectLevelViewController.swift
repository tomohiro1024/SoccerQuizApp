//
//  SelectLevelViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/03/22.
//

import UIKit
import AVFoundation

class SelectLevelViewController: UIViewController {
    
    @IBOutlet weak var level1Button: UIButton!
    @IBOutlet weak var level2Button: UIButton!
    @IBOutlet weak var level3Button: UIButton!
    @IBOutlet weak var level4Button: UIButton!
    
    var selectTag = 0
    var bkyr: AVAudioPlayer!
    
    let url = Bundle.main.bundleURL.appendingPathComponent("BKYR.mp3")

    override func viewDidLoad() {
        super.viewDidLoad()

        level1Button.layer.borderWidth = 2
        level1Button.layer.borderColor = UIColor.black.cgColor
        
        level2Button.layer.borderWidth = 2
        level2Button.layer.borderColor = UIColor.black.cgColor
        
        level3Button.layer.borderWidth = 2
        level3Button.layer.borderColor = UIColor.black.cgColor
        
        level4Button.layer.borderWidth = 2
        level4Button.layer.borderColor = UIColor.black.cgColor
        
        do {
            try bkyr = AVAudioPlayer(contentsOf:url)
            //音楽をバッファに読み込んでおく
            bkyr.prepareToPlay()
        } catch {
            print(error)
        }
    }
    //問題画面に選択したレベルの値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLabel = selectTag
    }
    //レベル選択ボタンが押された場合に呼ばれるメソッド
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
        bkyr.stop()
    }
    
    // 他の画面で戻るボタンが押下された場合実行される
    override func viewDidAppear(_ animated: Bool) {
        bkyr.play()
    }
    


}
