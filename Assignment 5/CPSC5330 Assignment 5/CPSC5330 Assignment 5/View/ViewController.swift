//
//  ViewController.swift
//  CPSC5330 Assignment 5
//
//  Created by Christian Polka on 6/22/24.
//

import UIKit






class ViewController: UIViewController {

    @IBOutlet weak var Prompt: UILabel!
    
    @IBOutlet weak var ResponseOne: UIButton!
    
    @IBOutlet weak var ResponseTwo: UIButton!
    
    @IBOutlet weak var Reset: UIButton!
    
    
    let adventurePath = AdventureModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }


    @IBAction func ChoiceOne(_ sender: UIButton) {
        adventurePath.makeChoice(0)
        updateUI()
    }
    
    @IBAction func ChoiceTwo(_ sender: UIButton) {
        adventurePath.makeChoice(1)
        updateUI()
    }
    
    @IBAction func StartOver(_ sender: UIButton) {
        adventurePath.restartAdventure()
        updateUI()
    }
    
    
    func updateUI() {
        let currentStep = adventurePath.getCurrentStep()
        Prompt.text = currentStep.description
        
        if currentStep.options.count > 0 {
            ResponseOne.setTitle(currentStep.options[0], for: .normal)
            ResponseOne.isHidden = false
        } else {
            ResponseOne.isHidden = true
        }
        
        if currentStep.options.count > 1 {
            ResponseTwo.setTitle(currentStep.options[1], for: .normal)
            ResponseTwo.isHidden = false
        } else {
            ResponseTwo.isHidden = true
        }
        
        Reset.isHidden = !adventurePath.isAdventureOver()
    }
}

