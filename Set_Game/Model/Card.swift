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
    let identifier: Int
    let color: cardColor
    let shape: cardShape
    let shading: cardShading
    let numberOfShapes: cardNumberOfShapes
    var isMatched = false
    var isSelected = false
    var isRevieled = false
    
    static private var indetifierFactory = 0
   
    
    // ------ Methods ------\\
    static private func getUniqueIdentifier() -> Int {
        indetifierFactory += 1
        return indetifierFactory
    }
    
    init(color: cardColor , shape: cardShape,shading: cardShading,numberOfShapes: cardNumberOfShapes) {
        self.identifier = Card.getUniqueIdentifier()
        self.color = color
        self.shape = shape
        self.shading = shading
        self.numberOfShapes = numberOfShapes
        
    }
}
