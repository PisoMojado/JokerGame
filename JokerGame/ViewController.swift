//
//  ViewController.swift
//  JokerGame
//
//  Created by Sydnee  Spruiell on 1/13/17.
//  Copyright © 2017 Eric Eldridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myDeck = Deck()
    var topCardName: String = ""
    var selectedCard: Int = 1
    var card1Data = CardData()
    var card2Data = CardData()
    var card3Data = CardData()
    var card4Data = CardData()
    var card5Data = CardData()
    var card6Data = CardData()
    
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


    @IBAction func cardInHand1(_ sender: UIButton) {
        //Tell Controller class button was clicked
        //Controller.card1Called()
        selectedCard = 1
    }
    
    @IBAction func cardInHand2(_ sender: UIButton) {
        selectedCard = 2
    }
    
    @IBAction func cardInHand3(_ sender: UIButton) {
        selectedCard = 3
    }
    
    @IBAction func cardInHand4(_ sender: UIButton) {
        selectedCard = 4
    }
    
    @IBAction func cardInHand5(_ sender: UIButton) {
        selectedCard = 5
    }
    
    @IBAction func cardInHand6(_ sender: UIButton) {
        selectedCard = 6
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        showTopCard()
        storeCardData()
        dealCard()
    }

    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    
    func storeCardData() {
        let topCard:Card = myDeck.cards[0]
        var cardData = CardData()
        switch selectedCard {
        case 1:
            cardData = card1Data
        case 2:
            cardData = card2Data
        case 3:
            cardData = card3Data
        case 4:
            cardData = card4Data
        case 5:
            cardData = card5Data
        case 6:
            cardData = card6Data
        default:
            print("Please select a card!")
            return
        }
        cardData.movementPoints = getMovementPoints(card: topCard)
        cardData.leavesHome = getLeavesHome(card: topCard)
        cardData.movesForward = getMovesForward(card: topCard)
        cardData.splittable = getSplittable(card: topCard)
    }
    
    func getMovementPoints(card:Card) -> Int {
        let cardRank: Int = card.cardRankID
        var movementPoints: Int = 0
        switch cardRank {
        case 1,2,3,4,5,6,7,8,9,10:
            movementPoints = card.cardRankID
        case 11,12,13:
            movementPoints = 10
        case 0:
            movementPoints = 1
        default:
            print("Card does not have a viable rank!")
        }
        // Debugger text
        // print("The card has \(movementPoints) movement points")
        return movementPoints
    }
   
    func getLeavesHome(card:Card) -> Bool {
        let cardRank: Int = card.cardRankID
        var leavesHome: Bool = false
        switch cardRank {
        case 2,3,4,5,6,7,8,9,10:
            leavesHome = false
        case 0,1,11,12,13:
            leavesHome = true
        default:
            print("Card does not have a viable rank!")
        }
        // Debugger text
        // print("It is \(leavesHome) that the card can get a marble out")
        return leavesHome
    }
    
    func getMovesForward(card:Card) -> Bool {
        let cardRank: Int = card.cardRankID
        var movesForward: Bool = true
        switch cardRank {
        case 0,1,2,3,4,5,6,7,9,10,11,12,13:
            movesForward = true
        case 8:
            movesForward = false
        default:
            print("Card does not have a viable rank!")
        }
        // Debugger text
        // print("It is \(movesForward) that the card moves the marble forward")
        return movesForward
    }
    
    func getSplittable(card:Card) -> Bool {
        let cardRank: Int = card.cardRankID
        var splittable: Bool = true
        switch cardRank {
        case 0,1,2,3,4,5,6,8,9,10,11,12,13:
            splittable = false
        case 7:
            splittable = true
        default:
            print("Card does not have a viable rank!")
        }
        // Debugger text
        // print("It is \(splittable) that the card can be split between two marbles")
        return splittable
    }
    
    func dealCard() -> Card {
        let topCard:Card = myDeck.cards[0]
        myDeck.removeCards(num: 1, cards: myDeck.cards)
        return topCard
    }
    
    func showTopCard() {
        let topCard:Card = myDeck.cards[0]
        let cardName = topCard.name
        var card: UIButton
        switch selectedCard {
            case 1:
                card = self.card1
            case 2:
                card = self.card2
            case 3:
                card = self.card3
            case 4:
                card = self.card4
            case 5:
                card = self.card5
            case 6:
                card = self.card6
            default:
                print("Please select a card!")
                return
        }
        updateCardUI(card: card, cardName: cardName)
    }
    
    func updateCardUI(card: UIButton, cardName: String) {
        card.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
    }
}
