//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
class SetGame {
   //------ Attributes ------\\
    private(set) var cards: [Card]
    private var numOfAllreadySelectedCards = 0
    private var firstSelectedCard : Card?
    private var secondSelectedCard : Card?
    private var thirdSelectedCard : Card?
    private(set) var points = 0
   //------ Methods ------\\
     init(){
        
       // 1) Crate 81 Cards that represent the Set logic with 4 attributes (Mattrix? Booleans? need more discusion )
        var cards = [Card]()
        for color in cardColor.allCases {
            for shape in cardShape.allCases {
                for shading in cardShading.allCases{
                    for number in cardNumberOfShapes.allCases{
                        let card = Card(color: color , shape: shape, shading: shading, numberOfShapes: number)
                        cards.append(card)
                    }
                }
            }
        }
        
       // 2) Shuffle them each time
        cards.shuffle() // TODO: Need to test if this does not disrupt game logic
        self.cards = cards
    }
    
    //------ Methods ------\\
    
    
    func chooseCard(at index: Int ) -> String {
        assert(cards.indices.contains(index) , "SetGame.chooseCard(at: \(index) ) : Chosen index not in cards ")
        if !cards[index].isMatched && cards[index].isRevieled {
            if cards[index].isSelected {
                cards[index].isSelected = false
                numOfAllreadySelectedCards -= 1
            } else {
                switch self.numOfAllreadySelectedCards {
                case 0,1:
                    return "ok"
                case 2:
                    if
                    {
                        self.points += 5
                        return "match"
                    }
                    self.points -= 1
                    return "noMatch"
                default:
                    return "error"
                        
                }
            }
        }
        else {
            return "noCahnge"
        }
        
    }
    
}
