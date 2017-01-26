//
//  Deck.swift
//  JokerGame
//
//  Created by Michael Jones on 1/22/17.
//  Copyright © 2017 Eric Eldridge. All rights reserved.
//

import Foundation

struct Deck {
    var cards: [Card]
    
    init() {
        cards = FrenchCard.getAllCards()
        cards.append(Joker())
        cards.append(Joker())
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
    
    mutating func shuffle() {
        let deckSize:Int = cards.count
        var cardHolder: Card
        for i:Int in 0...deckSize-1 {
            let rand = randomIntFrom(start: i, to: deckSize-1)
            cardHolder = cards[i]
            cards[i] = cards[rand]
            cards[rand] = cardHolder
        }
    }
    
    mutating func addCards(cards: [Card]) {
        self.cards += cards
    }
    
    mutating func removeCards(num:Int, cards: [Card]) {
        for i in 0...(num-1) {
            self.cards.remove(at: i)
        }
    }
}
