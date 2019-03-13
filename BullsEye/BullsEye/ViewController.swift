//
//  ViewController.swift
//  BullsEye
//
//  Created by Mondale on 3/4/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 50
    var targetValue = 0
    var score: Int = 0
    var round: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: .alert)
    
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
}

