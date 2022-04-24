//
//  ViewController.swift
//  Set_Game
//
//  Created by Roie Malykin on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {
    //------ Attributes ------\\
    private var game = SetGame()
    @IBOutlet private var setCardButtons: [UIButton]!
    
    //------ Methods ------\\
    @IBAction private func touchCard(_ sender: UIButton)  {
        if let cardNumber = setCardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButton! - > This is a bug")
        }
    }
    
    
    
    private func updateViewFromModel() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

