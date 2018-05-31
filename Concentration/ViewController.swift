//
//  ViewController.swift
//  Concentration
//
//  Created by Radosław Serek on 04.03.2018.
//  Copyright © 2018 Radosław Serek. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateUIFromModel()
        }
    }
    
    private func resetGame() {
        game.resetGame()
        updateUIFromModel()
    }
    
    @IBAction private func startNewGame(_ sender: UIButton) {
        resetGame()
    }
    
    @IBAction private func chooseTheme(_ sender: UIButton) {
        emoji = [String]()
        emojiChoices = [Card:String]()
        if let chosenTheme = sender.currentTitle {
            emoji = themes[chosenTheme] ?? ["?"]
        }
        resetGame()
    }
    
    @IBOutlet private var cardButtons: [UIButton]!


    private func updateUIFromModel() {
        flipCountLabel.text = "Flip Count: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(chooseEmoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    private var themes: [String:Array<String>] = [
        "🚗" : ["🚗","🛴","✈️","🚠","🛵","🚛","🚑","🚀","🚁"],
        "🌽" : ["🌽","🍕","🥥","🥕","🥐","🍔","🍟","🌭","🍖"],
        "🐝" : ["🐝","🐔","🐷","🦁","🦅","🦋","🐌","🐞"],
        "🕹" : ["🕹","📡","📞","🎥","💾","💿","💻","⏰","🔋","💡"],
        "❤️" : ["❤️","🔱","♨️","⚠️","🔔","♦️","♠️","♣️"],
        "😀" : ["😅","😍","🤓","😘","😇","😱","🤯","🤬","😈","👺","👻"]
    ]
    
    private var emoji = ["🚗","🛴","✈️","🚠","🛵","🚛","🚑","🚀","🚁"]
    
    private var emojiChoices = [Card:String]()
    
    private func chooseEmoji (for card: Card) -> String {
        if emojiChoices[card] == nil, emoji.count > 0 {
            emojiChoices[card] = emoji.remove(at: emoji.count.arc4random)
        }
        return emojiChoices[card]!
    }
    
    
}


