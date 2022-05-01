//
//  Card.swift
//  Set_Game
//
//  Created by Roie Malykin on 20/04/2022.
//

import Foundation
struct Card: Hashable {
    // ------ Attributes ------\\
    let identifier: Int
    let color: CardColor
    let shape: CardShape
    let shading: CardShading
    let numberOfShapes: CardNumberOfShapes
    var isMatched = false
    var isMissMatched = false
    var isSelected = false
    // var isRevieled = false
    private static var indetifierFactory = 0
    // static func ==(otherCard: Card){
    // ------ Methods ------\\
    private static func uniqueIdentifier() -> Int {
        indetifierFactory += 1
        return indetifierFactory
    }
    
    init(color: CardColor, shape: CardShape, shading: CardShading, numberOfShapes: CardNumberOfShapes) {
        self.identifier = Card.uniqueIdentifier()
        self.color = color
        self.shape = shape
        self.shading = shading
        self.numberOfShapes = numberOfShapes
    }
}
