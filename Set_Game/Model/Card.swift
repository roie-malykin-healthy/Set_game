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
    let color: colorFeature
    let shape: ShapeFeature
    let shading: ShadingFeature
    let numberOfShapes: numberOfShapesFeature
    var isMatched = false
    var isSelected = false
    var isMatched = false
    
    static private var indetifierFactory = 0
   
    
    // ------ Methods ------\\
    static private func getUniqueIdentifier() -> Int {
        indetifierFactory += 1
        return indetifierFactory
    }
    
    init(color: colorFeature , shape: ShapeFeature,shading: ShadingFeature,numberOfShapes: numberOfShapesFeature) {
        self.identifier = Card.getUniqueIdentifier()
        self.color = color
        self.shape = shape
        self.shading = shading
        self.numberOfShapes = numberOfShapes
        
    }
}
