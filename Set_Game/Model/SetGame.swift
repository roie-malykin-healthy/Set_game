//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
struct SetGame {
   //------ Attributes ------\\
    private let cards: [Card]
    
   //------ Methods ------\\
    init(){
        
       // 1) Crate 81 Cards that represent the Set logic with 4 attributes (Mattrix? Booleans? need more discusion )
        var cards = [Card]()
        for color in colorFeature.allCases {
            for shape in ShapeFeature.allCases {
                for shading in ShadingFeature.allCases{
                    for number in numberOfShapesFeature.allCases{
                        let card = Card(color: color , shape: shape, shading: shading, numberOfShapes: number)
                        cards.append(card)
                    }
                }
            }
        }
        
       // 2) Shuffle them each time
        cards.shuffle()
        self.cards = cards
    }
    
    //------ Methods ------\\
    
    
    func chooseCard(at index: Int ){
        assert(cards.indices.contains(index) , "SetGame.chooseCard(at: \(index) ) : Chosen index not in cards ")
        // Choose card logic
    }
    
}
