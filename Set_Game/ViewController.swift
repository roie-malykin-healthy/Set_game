//
//  ViewController.swift
//  Set_Game
//
//  Created by Roie Malykin on 19/04/2022.
//

import UIKit

final class ViewController: UIViewController {
    // ------ Attributes ------\\
    @IBOutlet private var setCardButtons: [UIButton]!
    @IBOutlet private weak var give3CardsBUtton: UIButton!
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private weak var scoreText: UITextField!
    
    private var game = SetGame(maxNumOfCardsOnBoard: setCardButtons,numOfInitialReviledCards:12)
    
    // ------ Actions ------\\
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = setCardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButton! - > This is a bug")
        }
    }
    
    @IBAction private func touch3MoreCards(_ sender: UIButton) {
        // game.revialThreeCards()
        updateViewFromModel()
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        newGameView()
    }
    
    func newGameView() {
        game = SetGame()
        revieleNewCard
        // #warning Check validity
    }
    // --- Methods ---\\
    private func updateScoreText( currentScore: Int) {
        scoreText.text = "Score : \(currentScore)"
    }
    
    private func updateViewFromModel() {
        
    }
    
    private func flipCard(cardFeatures: AttributedString , on button: UIButton) {
        if button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
