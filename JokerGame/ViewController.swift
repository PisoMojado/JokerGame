//
//  ViewController.swift
//  JokerGame
//
//  Created by Sydnee  Spruiell on 1/13/17.
//  Copyright © 2017 Eric Eldridge. All rights reserved.
//

import UIKit

protocol Card {

}

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

struct Joker: Card {

}

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

class ViewController: UIViewController {

    var myDeck = Deck()
    var topCardName: String = ""
    var selectedCard: Int = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myDeck.addCards(cards: myDeck.cards)
        myDeck.shuffle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealNewCard() {
        
    }

    @IBAction func cardInHand1(_ sender: UIButton) {
        //Tell Controller class button was clicked
        //Controller.card1Called()
        selectedCard = 1
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)

    }
    @IBAction func cardInHand2(_ sender: UIButton) {
        selectedCard = 2
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)
    }
    
    @IBAction func cardInHand3(_ sender: UIButton) {
        selectedCard = 3
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)
    }
    
    @IBAction func cardInHand4(_ sender: UIButton) {
        selectedCard = 4
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)
    }
    
    @IBAction func cardInHand5(_ sender: UIButton) {
        selectedCard = 5
       let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)
    }
    
    @IBAction func cardInHand6(_ sender: UIButton) {
        selectedCard = 6
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        sender.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        myDeck.removeCards(num: 1, cards: myDeck.cards)
    }

}
/*
class Controller {
    func card1Called() {
        //Called from View when card1 is clicked
        
    }

}
*/
