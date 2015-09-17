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
    @IBOutlet weak var entropySentence: UILabel!
    
    /// our local friendly instance of the PasswordGenerator brain
    let generator = PasswordGenerator()

    /// displays a new random passphrase based on current settings
    func randomizePhrase() {
        let animation = CATransition()
        animation.duration = 0.1
        animation.type = kCATransitionFade
        passwordLabel.layer.addAnimation(animation, forKey: "changeTextTransition")

        passwordLabel.text = generator.phrase()
    }

    func updateEntropyDisplay() {
        entropySentence.text = String(format: "~%.1f bits of entropy", generator.entropy)
    }
    
    // if the van's a shakin', passwords be makin'
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if let e = event where e.subtype == UIEventSubtype.MotionShake {
            randomizePhrase()
        }
    }

    // MARK: - Navigation

    // be a dear and grab me a new passphrase whenever this screen loads
    override func viewWillAppear(animated: Bool) {
        updateEntropyDisplay()
        randomizePhrase()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // if wrapped in a UINavController
        if let uinc = segue.destinationViewController as? UINavigationController {
            if let svc = uinc.topViewController as? SettingsViewController {
                svc.pg = generator
            }
        }

        // if not wrapped
        if let svc = segue.destinationViewController as? SettingsViewController {
            svc.pg = generator
        }
    }
    
}

