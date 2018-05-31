//
//  Collection+OneAndOnly.swift
//  Concentration
//
//  Created by Radosław Serek on 18.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
