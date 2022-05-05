//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
final class SetGame {
    
    private var deck: DeckOfSetCards
    private(set) var board: [Card]
    private var numOfAllreadySelectedCards: Int {
        selectedCardIndecies.count
    }
    private(set) var points = 0
    private var selectedCardIndecies: [Int] {
        cards.indices.filter({ cards[$0].isSelected })
    }
    private(set) var board: [(Card)]
    
   // ------ Methods ------ \\
    init(maxNumOfCardsOnBoard: Int, numOfInitialReviledCards: Int) {
       
        
       // 3) Stage a board consisting of 12 revieled cards and 12 unrevieled cards
         
        
         
    }
    // ------ Methods ------ \\
    func chooseCard(at index: Int ) {
        assert(cards.indices.contains(index), "SetGame.chooseCard(at: \(index) ) : Chosen index not in cards ")
        if !cards[index].isMatched {
            if cards[index].isSelected {
                cards[index].isSelected = false
            } else {
                cards[index].isSelected = true
                switch numOfAllreadySelectedCards {
                case 2:
                    if areSelectedCardsMatch() {
                        self.points += 5
                        for index in selectedCardIndecies {
                            cards[index].isMatched = true
                        }
                    } else {
                        self.points -= 1
                        for index in selectedCardIndecies {
                            cards[index].isMissMatched = true
                        }
                    }
                    // return "noMatch"
                default:
                    // MARK: placeHolder
                    print("thus is place holder")
                }
            }
         } else {
        }
    }
    
    private func areSelectedCardsMatch() -> Bool {
        // #warning write match logic here
        let firstSelectedCard = cards[selectedCardIndecies[0]]
        let secondSelectedCard = cards[ selectedCardIndecies[1]]
        let thirdSelectedCard = cards[ selectedCardIndecies[1]]
        
        let isSetMatch: Bool = validFeatureMatch(firstCardFeature: firstSelectedCard.shading.rawValue, secondCardFeature: secondSelectedCard.shading.rawValue, thirdCardFeature: thirdSelectedCard.shading.rawValue) &&
                               validFeatureMatch(firstCardFeature: firstSelectedCard.shape.rawValue, secondCardFeature: secondSelectedCard.shape.rawValue, thirdCardFeature: thirdSelectedCard.shape.rawValue) &&
                               validFeatureMatch(firstCardFeature: firstSelectedCard.color.rawValue, secondCardFeature: secondSelectedCard.color.rawValue, thirdCardFeature: thirdSelectedCard.color.rawValue) &&
                               validFeatureMatch(firstCardFeature: firstSelectedCard.numberOfShapes.rawValue, secondCardFeature: secondSelectedCard.numberOfShapes.rawValue, thirdCardFeature: thirdSelectedCard.numberOfShapes.rawValue)
        return isSetMatch
    }
    
    private func validFeatureMatch( firstCardFeature: Int, secondCardFeature: Int, thirdCardFeature: Int) -> Bool {
        (firstCardFeature + secondCardFeature + thirdCardFeature).isMultiple(of: 3)
    }
    
    public func fetchCard() -> Card? {
        cards.popLast()
    }
}
