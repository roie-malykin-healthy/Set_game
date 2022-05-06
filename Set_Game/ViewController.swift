//
//  ViewController.swift
//  Set_Game
//
//  Created by Roie Malykin on 19/04/2022.
//

import UIKit

final class ViewController: UIViewController {
    // ------ Attributes ------\\
    private let maxNumOfCardsOnBoard = 24
    @IBOutlet private var setCardButtons: [UIButton]!
    @IBOutlet private weak var give3CardsBUtton: UIButton!
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private weak var scoreText: UITextField!
    
    private lazy var game = SetGame(maxNumOfCardsOnBoard: maxNumOfCardsOnBoard, numOfInitialReviledCards: 12)
    // ------ Actions ------\\
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = setCardButtons.firstIndex(of: sender) {
            if game.chooseCard(at: cardNumber) {
                updateViewFromModel()
            }
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
        game = SetGame(maxNumOfCardsOnBoard: setCardButtons.count, numOfInitialReviledCards: 12)
        // #warning Check validity
    }
    // --- Methods ---\\
    private func updateScoreText( currentScore: Int) {
        scoreText.text = "Score : \(currentScore)"
    }
    
    private func updateViewFromModel() {
        for index in 0..<maxNumOfCardsOnBoard {
            updateCardButton(index: index)
        }
    }
    
    private func updateCardButton(index: Int) {
        var cardButton = setCardButtons[index]
        let modelCard = game.board[index]
        
        if modelCard != nil {
            cardButton.isHidden = false
            if modelCard!.isSelected {
                cardButton.layer.borderWidth = 3.0
                cardButton.layer.cornerRadius = 8.0
                if modelCard!.isMatched {
                    cardButton.layer.borderColor = UIColor.yellow.cgColor
                } else if modelCard!.isMissMatched {
                    cardButton.layer.borderColor = UIColor.red.cgColor
                } else {
                    cardButton.layer.borderColor = UIColor.purple.cgColor
                }
            } else {
                cardButton.layer.borderWidth = 0
            }
            // Setting the cardButton.title for the modelCard
            cardButton.setAttributedTitle(cardAttributedTitle(card: modelCard!)!, for: UIControl.State.normal)
        } else {
            cardButton.isHidden = true
        }
    }
    
    private func cardAttributedTitle(card: Card) -> NSAttributedString? {
        let cardSymbol: String
        switch card.shape {
        case .cicrle:
            cardSymbol = "●"
        case .square:
            cardSymbol = "■"
        case .triangle:
            cardSymbol = "▲"
        }
        let numOfShapes: Int
        switch card.numberOfShapes {
        case .one:
            numOfShapes = 1
        case .two:
            numOfShapes = 2
        case .three:
            numOfShapes = 3
        }
        
        var cardString = ""
        for _ in 1...numOfShapes {
            cardString += cardSymbol
        }
        
        let shading: Float
        switch card.shading {
        case .solid:
            shading = -1.0
        case .striped:
            shading = -0.15
        case .open:
            shading = 0.50
        }
        
        var color = UIColor.white
        switch card.color {
        case .red:
            color = UIColor.red
        case .green:
            color = UIColor.green
        case .blue:
            color = UIColor.blue
        }
        
        let attributeConteiner: [NSAttributedString.Key: Any] = [
            .strokeColor: color, .strokeWidth: shading
        ]
        return NSAttributedString(string: cardString, attributes: attributeConteiner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
