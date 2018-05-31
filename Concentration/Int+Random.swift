//
//  Int+Random.swift
//  Concentration
//
//  Created by Radosław Serek on 17.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
