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
        case Jack, Queen, King, Joker
        
        func rankDescription() -> String {
            switch self{
            case.Jack: return "Jack"
            case.Queen: return "Queen"
            case.King: return "King"
            case.Ace: return "Ace"
            case.Joker: return "Joker"
            default: return String(self.rawValue)
            }
        }
    }
    
    enum Suit: String {
        case Spade = "Spades"
        case Heart = "Hearts"
        case Club = "Clubs"
        case Diamond = "Diamonds"
    }
    
    private static func getCardName(rank: Rank, suit: Suit) -> String {
        var cardString: String = ""
        var cardStringRank: String
        cardStringRank = String(rank.rawValue)
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
        cardString += suit.rawValue
        
        return cardString
    }
    
    let rank: Rank
    let suit: Suit
    var name: String
    var cardRankID: Int
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.cardRankID = self.rank.rawValue
        self.suit = suit
        name = FrenchCard.getCardName(rank: rank, suit: suit)
    }
    
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
}
