//
//  Array+shuffle.swift
//  Concentration
//
//  Created by Radosław Serek on 17.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle() {
        for _ in 0..<count {
            let randomIndexOne = Int(arc4random_uniform(UInt32(count)))
            let randomIndexTwo = Int(arc4random_uniform(UInt32(count)))
            self.swapAt(randomIndexOne, randomIndexTwo)
        }
    }
}


