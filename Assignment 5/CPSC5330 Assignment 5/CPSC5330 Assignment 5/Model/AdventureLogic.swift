//
//  AdventureLogic.swift
//  CPSC5330 Assignment 5
//
//  Created by Christian Polka on 6/23/24.
//

import Foundation
class AdventureModel {
    private var steps: [AdventureStep]
    private var currentStep: Int
    
    init() {
        self.steps = [
            AdventureStep(description: "You are at the base of a tall mountain. The summit looks daunting. Do you:",
                          options: ["Start climbing immediately", "Set up camp and rest"],
                          outcomes: [1, 2]),
            AdventureStep(description: "You start climbing. The weather gets worse. Do you:",
                          options: ["Continue climbing", "Seek shelter"],
                          outcomes: [3, 4]),
            AdventureStep(description: "You set up camp and rest. In the morning, you feel refreshed. Do you:",
                          options: ["Start climbing", "Pack up and go home"],
                          outcomes: [1, 5]),
            AdventureStep(description: "You continue climbing despite the bad weather. A storm hits you. Do you:",
                          options: ["Push through the storm", "Find a place to wait out the storm"],
                          outcomes: [6, 4]),
            AdventureStep(description: "You find shelter and wait out the storm. After the storm passes, do you:",
                          options: ["Continue climbing", "Descend the mountain"],
                          outcomes: [7, 5]),
            AdventureStep(description: "You decide to go home. You have failed to climb the mountain.",
                          options: [],
                          outcomes: []),
            AdventureStep(description: "You push through the storm and reach the summit. Congratulations! You have successfully climbed the mountain.",
                          options: [],
                          outcomes: []),
            AdventureStep(description: "After the storm, you continue climbing and reach the summit. Congratulations! You have successfully climbed the mountain.",
                          options: [],
                          outcomes: [])
        ]
        self.currentStep = 0
    }
    
    func getCurrentStep() -> AdventureStep {
        return steps[currentStep]
    }
    
    func makeChoice(_ choiceIndex: Int) {
        guard choiceIndex < steps[currentStep].outcomes.count else {
            print("Invalid choice index")
            return
        }
        
        let nextStepIndex = steps[currentStep].outcomes[choiceIndex]
        currentStep = nextStepIndex
    }
    
    func isAdventureOver() -> Bool {
        return steps[currentStep].options.isEmpty
    }
    
    func restartAdventure() {
        currentStep = 0
    }
}
