//
//  SecondScreenViewController.swift
//  Roshambo
//
//  Created by Roman Morozov on 18.09.18.
//  Copyright © 2018 Morozov. All rights reserved.
//


import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class SecondScreenViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    private func displayResult(){
        
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock),(.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup)!"
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        image.image = UIImage(named: imageName)
        label.text = text
    
        
    }
    
}
