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
    @IBOutlet private weak var scoreLabel: UILabel!
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
        for _ in 1...3 {
        game.putNewCardOnBoard()
        }
        updateViewFromModel()
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        newGameView()
    }
    
    func newGameView() {
        game = SetGame(maxNumOfCardsOnBoard: setCardButtons.count, numOfInitialReviledCards: 12)
        updateViewFromModel()
        // #warning Check validity
    }
    // --- Methods ---\\
    private func updateViewFromModel() {
        for index in 0..<maxNumOfCardsOnBoard {
            updateCardButton(index: index)
        }
        scoreLabel.text = "Score : \(game.points)"
    }
    
    private func updateCardButton(index: Int) {
        let cardButton = setCardButtons[index]
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
        
        let shading:(strokeWidth: Float, alphaForground: CGFloat)
        switch card.shading {
        case .solid:
            shading.strokeWidth = -15
            shading.alphaForground = 1
        case .striped:
            shading.strokeWidth = -1
            shading.alphaForground = 0.3
        case .open:
            shading.strokeWidth = 5
            shading.alphaForground = 1
        }
        
        var color = UIColor.white
        switch card.color {
        case .red:
            color = UIColor.red.withAlphaComponent(shading.alphaForground)
        case .green:
            color = UIColor.green.withAlphaComponent(shading.alphaForground)
        case .blue:
            color = UIColor.cyan.withAlphaComponent(shading.alphaForground)
        }
        
        let attributeConteiner: [NSAttributedString.Key: Any] = [
            .strokeColor: color, .strokeWidth: shading.strokeWidth, .foregroundColor: color
        ]
        return NSAttributedString(string: cardString, attributes: attributeConteiner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for cardButton in setCardButtons {
            cardButton.backgroundColor = UIColor.black
        }
       updateViewFromModel()
    }
}
