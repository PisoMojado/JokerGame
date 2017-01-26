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
    
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myDeck.addCards(cards: myDeck.cards)
        myDeck.shuffle()
        dealInitialHand()
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
        dealTopCardToHand(handIndex: selectedCard)
        storeCardData(cardIndex: selectedCard)
        popTopCard()
        
    }
    
    func getUICardFromInd(cardIndex:Int) throws -> UIButton{
        switch cardIndex {
        case 1:
            return card1
        case 2:
            return card2
        case 3:
            return card3
        case 4:
            return card4
        case 5:
            return card5
        case 6:
            return card6
        default:
            throw CardSelectionError.BadCardSelection
        }
    }
    
    func getCardIndFromUI(cardUI: UIButton) throws -> Int {
        switch cardUI {
        case self.card1:
            return 1
        case self.card2:
            return 2
        case self.card3:
            return 3
        case self.card4:
            return 4
        case self.card5:
            return 5
        case self.card6:
            return 6
        default:
            throw CardSelectionError.BadCardSelection
        }
    }
    
    func getCardDataFromInd(cardIndex:Int) throws -> CardData {
        switch cardIndex {
        case 1:
            return card1Data
        case 2:
            return card2Data
        case 3:
            return card3Data
        case 4:
            return card4Data
        case 5:
            return card5Data
        case 6:
            return card6Data
        default:
            throw CardSelectionError.BadCardSelection
        }
    }
    
    enum CardSelectionError : Error {
        case BadCardSelection
    }
    
    func storeCardData(cardIndex:Int) {
        let topCard:Card = myDeck.cards[0]
        do {
            var cardData = try getCardDataFromInd(cardIndex: cardIndex)
            cardData.movementPoints = getMovementPoints(card: topCard)
            cardData.leavesHome = getLeavesHome(card: topCard)
            cardData.movesForward = getMovesForward(card: topCard)
            cardData.splittable = getSplittable(card: topCard)
        } catch {
            
        }
    }
    
    func popTopCard() -> Card {
        let topCard:Card = myDeck.cards[0]
        myDeck.removeCards(num: 1, cards: myDeck.cards)
        return topCard
    }
    
    func updateCardUI(card: UIButton, cardName: String) {
        card.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
    }
    
    func dealTopCardToHand(handIndex:Int) {
        let topCard:Card = myDeck.cards[0]
        let cardName = topCard.name
        do {
            updateCardUI(card: try getUICardFromInd(cardIndex: selectedCard), cardName: cardName)
        } catch {
            
        }
        popTopCard()
    }
    
    func dealInitialHand() {
        dealTopCardToHand(handIndex: 1)
        dealTopCardToHand(handIndex: 2)
        dealTopCardToHand(handIndex: 3)
        dealTopCardToHand(handIndex: 4)
        dealTopCardToHand(handIndex: 5)
        dealTopCardToHand(handIndex: 6)
    }
}
