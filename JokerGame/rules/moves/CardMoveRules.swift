//
//  CardMoveRules.swift
//  JokerGame
//
//  Created by Michael Jones on 1/25/17.
//  Copyright © 2017 Eric Eldridge. All rights reserved.
//

import Foundation


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
