//
//  ViewController.swift
//  Swift_BullsEye
//
//  Created by Wico on 1/28/16.
//  Copyright © 2016 bun. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizeable =
                        trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizeable, forState: .Normal)
        }

        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizeable =
                        trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizeable, forState: .Normal)
        }

        startNewGame()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func showAlert() {

        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "excellent !"
            points += 100
        } else if difference == 1 {
            title = "almost"
            points += 50
        } else if difference < 5 {
            title = "almost"
        } else if difference < 10 {
            title = "pretty good"
        } else {
            title = "not even close"
        }

        score += points
        
        let message = "Your score is \(points) points\n"
        //+ "The value of the slider is : \(currentValue)\n"
        //+ "The target value is: \(targetValue)\n"
        //+ "The difference is: \(difference)"
        
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)

        let action = UIAlertAction(title: "OK",
            style: .Default,
            handler: {action in
                        self.startNewRound()
                        self.updateLabels()
                    })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()

        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseOut)

        view.layer.addAnimation(transition, forKey: nil)
    }

    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

