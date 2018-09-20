//
//  ViewController.swift
//  Roshambo
//
//  Created by Roman Morozov on 18.09.18.
//  Copyright © 2018 Morozov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func rockButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondScreenViewController") as! SecondScreenViewController
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func paperButton(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let vc = segue.destination as? SecondScreenViewController
            vc?.userChoice = getUserShape(sender as! UIButton)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }

}

