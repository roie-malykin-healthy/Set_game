//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
final class SetGame {
   // ------ Attributes ------ \\
    private(set) var cards: [Card]
    private var numOfAllreadySelectedCards: Int {
        selectedCardIndecies.count
    }
   
    private(set) var points = 0
    private var selectedCardIndecies: [Int] {
        cards.indices.filter({ cards[$0].isSelected })
    }
    
   // ------ Methods ------ \\
     init() {
       // 1) Crate 81 Cards that represent the Set logic with 4 attributes (Mattrix? Booleans? need more discusion )
        var cards = [Card]()
        for color in cardColor.allCases {
            for shape in cardShape.allCases {
                for shading in cardShading.allCases {
                    for number in cardNumberOfShapes.allCases {
                        let card = Card(color: color, shape: shape, shading: shading, numberOfShapes: number)
                        cards.append(card)
                    }
                }
            }
        }
        
       // 2) Shuffle them each time
        cards.shuffle() // #warning Need to test if this does not disrupt game logic
        self.cards = cards
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
        _ = cards[selectedCardIndecies[0]]
        let secondSelectedCard = cards[ selectedCardIndecies[1] ]
        let thirdSelectedCard = cards[ selectedCardIndecies[1] ]
        // MARK: placeHolder
        return true
    }
}
