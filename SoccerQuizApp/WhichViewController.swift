//
//  WhichViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/04/24.
//

import UIKit

class WhichViewController: UIViewController {
    
    @IBOutlet weak var japanButton: UIButton!
    @IBOutlet weak var overseasButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        japanButton.layer.borderWidth = 2
        japanButton.layer.borderColor = UIColor.black.cgColor
        
        overseasButton.layer.borderWidth = 2
        overseasButton.layer.borderColor = UIColor.black.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
