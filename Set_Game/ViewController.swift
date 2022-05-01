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
    @IBOutlet weak var give3CardsBUtton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var scoreText: UITextField!
    
    //------ Actions ------\\
    @IBAction private func touchCard(_ sender: UIButton)  {
        if let cardNumber = setCardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButton! - > This is a bug")
        }
    }
    
    @IBAction func touch3MoreCards(_ sender: UIButton) {
        //game.revialThreeCards()
        updateViewFromModel()
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        newGameView()
    }
    
    func newGameView(){
        game = SetGame()
        //  TODO: Check validity
    }
    
    
    //--- Methods ---\\
    
    private func updateScoreText(current_score: Int)
    {
        scoreText.text = "Score : \(current_score)"
    }
    
    private func updateViewFromModel() {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

