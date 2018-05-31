//
//  Card.swift
//  Concentration
//
//  Created by Radosław Serek on 10.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isMatched = false
    var isFaceUp = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func createUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.createUniqueIdentifier()
    }
}
