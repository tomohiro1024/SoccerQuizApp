//
//  ViewController.swift
//  SoccerQuizApp
//
//  Created by 宮野智宏 on 2021/03/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.cornerRadius = 10.0
        
    }


}

