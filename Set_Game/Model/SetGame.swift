//
//  SetGame.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
struct SetGame {
   //------ Attributes ------\\
    private(set) var cards = [Card]()
    
   //------ Methods ------\\
    init(){
        
       // 1) Crate 81 Cards that represent the Set logic with 4 attributes (Mattrix? Booleans? need more discusion )
       // 2) Shuffle them each time
    }
    func chooseCard(at index: Int ){
        assert(cards.indices.contains(index) , "SetGame.chooseCard(at: \(index) ) : Chosen index not in cards ")
        // Choose card logic
    }
    
}
