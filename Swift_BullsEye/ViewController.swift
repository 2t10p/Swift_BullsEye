//
//  ViewController.swift
//  Swift_BullsEye
//
//  Created by Wico on 1/28/16.
//  Copyright © 2016 bun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World",
            message: "This is BullsEye app",
            preferredStyle: .Alert)

        let action = UIAlertAction(title: "Awesome",
            style: .Default,
            handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoves(slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
    }
    
}

