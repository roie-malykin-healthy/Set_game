//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
final class SetGame {
    private var deck: DeckOfSetCards
    private let maxCardsOnBoard: Int
    private(set) var board: [Card?]
    private(set) var points = 0
    private var selectedCardIndecies: [Int] {
        board.indices.filter({ board[$0] != nil && board[$0]!.isSelected })
    }
    private var numOfAllreadySelectedCards: Int {
        selectedCardIndecies.count
    }
    
    // ------ Methods ------ \\
    init(maxNumOfCardsOnBoard: Int, numOfInitialReviledCards: Int) {
        self.deck = DeckOfSetCards()
        self.maxCardsOnBoard = maxNumOfCardsOnBoard
        self.board = [Card?](repeating: nil, count: maxNumOfCardsOnBoard)
        for _ in 0..<numOfInitialReviledCards {
            putNewCardOnBoard()
        }
    }
    private func removeCardFromBoard(index: Int) {
        assert(board.indices.contains(index), "SetGame.removeCardFromBoard(index:\(index)) , Chosen index not in board")
        assert(board[index] == nil, "SetGame.removeCardFromBoard(index:\(index)) , Chosen index is nil , Error you try to remove a non existing card ")
        board[index] = nil
    }
    private func putNewCardOnBoard() {
        assert(board.count <= maxCardsOnBoard, "SetGame.revielNewCardFromDeck() , you try to draw more then max cards allowed on board! which is \(maxCardsOnBoard) ")
        let vacantSpace = board.firstIndex(of: nil)
        if vacantSpace != nil {
            board[vacantSpace!] = deck.fetchCard()
        }
    }
    func chooseCard(at index: Int ) -> Bool {
        assert(board.indices.contains(index), "SetGame.chooseCard(at: \(index) ) : Chosen index not on board ")
        
        guard let chosenCard = board[index] else {
            return false
        }
        if !chosenCard.isMatched {
            if chosenCard.isSelected {
                chosenCard.isSelected = false
            } else {
                chosenCard.isSelected = true
                switch numOfAllreadySelectedCards {
                case 2:
                    if areSelectedCardsMatch() {
                        self.points += 5
                        for index in selectedCardIndecies {
                            chosenCard.isMatched = true
                        }
                    } else {
                        self.points -= 1
                        for index in selectedCardIndecies {
                            chosenCard.isMissMatched = true
                        }
                    }
                    // return "noMatch"
                default:
                    // MARK: placeHolder
                    print("thus is place holder")
                }
            }
        } else {
            return false
        }
        return true
    }
    
    private func areSelectedCardsMatch() -> Bool {
        // #warning write match logic here
        let firstSelectedCard = board[selectedCardIndecies[0]]!
        let secondSelectedCard = board[selectedCardIndecies[1]]!
        let thirdSelectedCard = board[selectedCardIndecies[2]]!
        
        let isSetMatch: Bool = validFeatureMatch(firstCardFeature: firstSelectedCard.shading.rawValue, secondCardFeature: secondSelectedCard.shading.rawValue, thirdCardFeature: thirdSelectedCard.shading.rawValue) &&
        validFeatureMatch(firstCardFeature: firstSelectedCard.shape.rawValue, secondCardFeature: secondSelectedCard.shape.rawValue, thirdCardFeature: thirdSelectedCard.shape.rawValue) &&
        validFeatureMatch(firstCardFeature: firstSelectedCard.color.rawValue, secondCardFeature: secondSelectedCard.color.rawValue, thirdCardFeature: thirdSelectedCard.color.rawValue) &&
        validFeatureMatch(firstCardFeature: firstSelectedCard.numberOfShapes.rawValue, secondCardFeature: secondSelectedCard.numberOfShapes.rawValue, thirdCardFeature: thirdSelectedCard.numberOfShapes.rawValue)
        return isSetMatch
    }
    
    private func validFeatureMatch( firstCardFeature: Int, secondCardFeature: Int, thirdCardFeature: Int) -> Bool {
        (firstCardFeature + secondCardFeature + thirdCardFeature).isMultiple(of: 3)
    }
    
    func fetchCard() -> Card? {
        deck.fetchCard()
    }
}
