//
//  ViewController.swift
//  xkcdpass
//
//  Created by Matthew Rothenberg on 11/8/14.
//  Copyright (c) 2014 Matthew Rothenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    /// our local friendly instance of the PasswordGenerator brain
    let generator = PasswordGenerator()
    
    
    /// displays a new random passphrase based on current settings
    func randomizePhrase() {
        passwordLabel.text = generator.phrase()
    }
    
    // if the van's a shakin', passwords be makin'
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            randomizePhrase()
        }
    }
    
    // be a dear and grab me one when we first start up too
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizePhrase()
    }
    
}

