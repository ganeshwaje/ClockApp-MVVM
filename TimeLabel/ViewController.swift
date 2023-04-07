//
//  ViewController.swift
//  TimeLabel
//
//  Created by Ganesh Waje on 7/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        view.addSubview(timerLabel)
        timerLabel.center = view.center
        
        timerLabel.startTimer()
    }
}

