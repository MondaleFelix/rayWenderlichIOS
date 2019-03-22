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
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
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
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            score += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                score += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close"
        }
        score += points

        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        // the event button on the alert modal
        // third parameter is what executes when modal is dismissed, also known as callback
        // The handler is being passed a closure,a method without a namew
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: { _ in
                                                    self.startNewRound()
                                            })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
}

