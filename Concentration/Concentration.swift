//
//  Concentration.swift
//  Concentration
//
//  Created by Radosław Serek on 10.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import Foundation

class Concentration
{
    
    private(set) var cards = [Card]()
    
    var flipCount = 0
    
    var score = 0

    private var alreadySeenCards = [Int]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{ cards[$0].isFaceUp } .oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    //TODO score
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard: \(index) not in cards")
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if !alreadySeenCards.contains(index) {
                        alreadySeenCards.append(index)
                    } else {
                        score -= 1
                    }
                    if !alreadySeenCards.contains(matchIndex) {
                        alreadySeenCards.append(matchIndex)
                    } else {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //TODO New game button

    func resetGame() {
        flipCount = 0
        score = 0
        alreadySeenCards = []
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
            indexOfOneAndOnlyFaceUpCard = nil
        }
        cards.shuffle()
    }
    
    init (numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards>0, "There needs to be at least 1 pair of cards")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        //TODO shuffle the cards
        cards.shuffle()
    }
}


