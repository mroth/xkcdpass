//
//  SettingsViewController.swift
//  xkcdpass
//
//  Created by Matthew Rothenberg on 2/5/15.
//  Copyright (c) 2015 Matthew Rothenberg. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var pg: PasswordGenerator!

    // MARK: Outlets
    @IBOutlet weak var minWordStepper:      UIStepper!
    @IBOutlet weak var maxWordStepper:      UIStepper!
    @IBOutlet weak var numWordStepper:      UIStepper!
    @IBOutlet weak var minWordLabel:        UILabel!
    @IBOutlet weak var maxWordLabel:        UILabel!
    @IBOutlet weak var numWordLabel:        UILabel!
    @IBOutlet weak var candidateDisplay:    UILabel!
    @IBOutlet weak var entropyDisplay:      UILabel!
    
    @IBAction func settingsDone() {
		dismiss(animated: true)
    }

    // MARK: Initializers
    
    /// Sets initial state of steppers based on current brain values.
    func setInitialStepperValues() {
        minWordStepper.value = Double(pg.minWordLength)
        maxWordStepper.value = Double(pg.maxWordLength)
        numWordStepper.value = Double(pg.numWords)
    }
    
    /// Updates all displays to the current state of brain.
    func updateDisplays() {
        minWordLabel.text = "\( pg.minWordLength )"
        maxWordLabel.text = "\( pg.maxWordLength )"
        numWordLabel.text = "\( pg.numWords )"
        
        candidateDisplay.text = "\( pg.numCandidates )"
        entropyDisplay.text = String(format: "~%.1f", pg.entropy)
    }
    
    
    // MARK: Actions
    // handles user adjusting any of the settings
    @IBAction func minWordStepperChanged(sender: UIStepper) {
        pg.minWordLength = Int(sender.value)
        updateDisplays()
    }
	
    @IBAction func maxWordStepperChanged(sender: UIStepper) {
        pg.maxWordLength = Int(sender.value)
        updateDisplays()
    }
	
    @IBAction func numWordStepperChanged(sender: UIStepper) {
        pg.numWords = Int(sender.value)
        updateDisplays()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialStepperValues()
        updateDisplays()
    }
}
