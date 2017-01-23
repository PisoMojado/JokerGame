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
        dealCard()
    }

    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    
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
