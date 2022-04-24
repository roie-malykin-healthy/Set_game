//
//  Card.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
struct Card : Hashable
{
    //------ Attributes ------\\
    var identifier: Int
    //let cardFeatures: SetGameFeature
    static private var indetifierFactory = 0
   
    
    // ------ Methods ------\\
    static private func getUniqueIdentifier() -> Int {
        indetifierFactory += 1
        return indetifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
