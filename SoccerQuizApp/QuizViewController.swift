//
//  QuizViewController.swift
//  SoccerQuizApp
//
//  Created by 智宏 on 2021/03/20.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    @IBOutlet weak var soccerImage: UIImageView!
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLabel = 0
    
    //QuizViewControllerの画面が表示された場合に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("選択したのはレベル\(selectLabel)")
        
        //問題データを配列に変換したのをcsvArrayに代入
        csvArray = loadCSV(fileName: "quiz\(selectLabel)")
        csvArray.shuffle()
        print(csvArray)
        
        //csvArrayの0番目を","区切りに配列にしたのをquizArrayに代入
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
        
        answerButton1.layer.borderWidth = 2
        answerButton1.layer.borderColor = UIColor.black.cgColor
        answerButton1.layer.cornerRadius = 10.0
        answerButton2.layer.borderWidth = 2
        answerButton2.layer.borderColor = UIColor.black.cgColor
        answerButton2.layer.cornerRadius = 10.0
        answerButton3.layer.borderWidth = 2
        answerButton3.layer.borderColor = UIColor.black.cgColor
        answerButton3.layer.cornerRadius = 10.0
        answerButton4.layer.borderWidth = 2
        answerButton4.layer.borderColor = UIColor.black.cgColor
        answerButton4.layer.cornerRadius = 10.0
        
        //問題画面に画像を追加
        let Path = Bundle.main.path(forResource: quizArray[6]as AnyObject as! String, ofType: nil)
        let soccer : UIImage = UIImage(contentsOfFile: Path!)!
        soccerImage.image = soccer
    }
    //画面遷移する時にScoreViewControllerのcorrectの変数にcorrectCount（正解数）を代入
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //選択肢ボタンが押された場合に呼ばれるメソッド
    @IBAction func btnAction(sender: UIButton) {
        //押されたボタンのタグの番号とquizArrayの1番目の番号を比較する
        if sender.tag == Int(quizArray[1]) {
            print("正解")
            correctCount += 1
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("スコア:\(correctCount)")
        judgeImageView.isHidden = false
        //ボタンを有効にするかどうか
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        //選択肢ボタンが押された0.5秒後に処理を行うメソッド
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
        
    }
    //次の問題
    func nextQuiz() {
        quizCount += 1
        //csvArrayのデータの数よりquizCountの数字が小さかった場合、次の問題をセット
        //次の問題がなかった場合elseのなかを実行する（スコア画面に遷移）
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
            //問題画面に問題を追加
            let Path = Bundle.main.path(forResource: quizArray[6]as AnyObject as! String, ofType: nil)
            let soccer : UIImage = UIImage(contentsOfFile: Path!)!
            soccerImage.image = soccer
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    
    //csvファイルの読み込み、配列に変換
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType:"csv")!
        do{
            let csvDate = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvDate.replacingOccurrences(of: "\r", with:"\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    

    

}
