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
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        if selectedCard >= 1 && selectedCard <= 6 {
          dealCard(card: topCard, cardNumber: selectedCard)
        }
        else {
        print("No card selected. Please select a card!")
        }
        
    }

    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    
    func dealCard(card: Card, cardNumber: Int) {
        let topCard:FrenchCard = myDeck.cards[0] as! FrenchCard
        let cardName: String = topCard.getCardName(card: topCard)
        print("\(cardName)")
        switch cardNumber {
        case 1:
           self.card1.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        case 2:
            self.card2.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        case 3:
            self.card3.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        case 4:
            self.card4.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        case 5:
            self.card5.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        case 6:
            self.card6.setImage(UIImage(named: cardName+".png"), for: UIControlState.normal)
        default:
            print("Invalid card selection")
        }
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
