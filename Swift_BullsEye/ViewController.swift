//
//  ViewController.swift
//  Swift_BullsEye
//
//  Created by Wico on 1/28/16.
//  Copyright © 2016 bun. All rights reserved.
//

import UIKit

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
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let points = 100 - difference
        score += points
        
        let message = "Your score is \(points) points\n"
                    //+ "The value of the slider is : \(currentValue)\n"
                    //+ "The target value is: \(targetValue)\n"
                    //+ "The difference is: \(difference)"

        let title: String
        
        if difference == 0 {
            title = "excellent !"
        } else if difference < 5 {
            title = "almost"
        } else if difference < 10 {
            title = "pretty good"
        } else {
            title = "not even close"
        }
        
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)

        let action = UIAlertAction(title: "OK",
            style: .Default,
            handler: nil)
        
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)

        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

