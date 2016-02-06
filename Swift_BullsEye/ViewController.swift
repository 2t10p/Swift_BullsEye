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

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLable.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    
    @IBAction func showAlert() {

        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        let message = "Your score is \(points) points\n"
                    //+ "The value of the slider is : \(currentValue)\n"
                    //+ "The target value is: \(targetValue)\n"
                    //+ "The difference is: \(difference)"
        
        let alert = UIAlertController(title: "Cool",
            message: message,
            preferredStyle: .Alert)

        let action = UIAlertAction(title: "OK",
            style: .Default,
            handler: nil)
        
        score += points
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)

        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

