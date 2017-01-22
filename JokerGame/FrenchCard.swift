//
//  FrenchCard.swift
//  JokerGame
//
//  Created by Michael Jones on 1/22/17.
//  Copyright © 2017 Eric Eldridge. All rights reserved.
//

import Foundation

struct FrenchCard: Card {
    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        
        func rankDescription() -> String {
            switch self{
            case.Jack: return "Jack"
            case.Queen: return "Queen"
            case.King: return "King"
            case.Ace: return "Ace"
            default: return String(self.rawValue)
            }    }
        
    }
    
    enum Suit: String {
        case Spade = "Spades"
        case Heart = "Hearts"
        case Club = "Clubs"
        case Diamond = "Diamonds"
    }
    
    let rank: Rank
    let suit: Suit
    
    static func getAllCards() -> [Card] {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Spade, Suit.Heart, Suit.Diamond, Suit.Club]
        var cards = [Card]()
        for suit in suits {
            for rank in ranks {
                cards.append(FrenchCard(rank: rank, suit: suit))
            }
        }
        return cards
    }
    
    func getCardName(card: FrenchCard) -> String {
        var cardString: String = ""
        var cardStringRank: String
        cardStringRank = String(card.rank.rawValue)
        switch cardStringRank {
        case "1":
            cardString += "A"
        case "11":
            cardString += "J"
        case "12":
            cardString += "Q"
        case "13":
            cardString += "K"
        default:
            cardString += cardStringRank
        }
        cardString += card.suit.rawValue
        
        return cardString
    }
}
