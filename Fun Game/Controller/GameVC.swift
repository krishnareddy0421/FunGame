//
//  GameVC.swift
//  Fun Game
//
//  Created by vamsi krishna reddy kamjula on 11/2/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var catKillLbl: UILabel!
    
    var bgColor: UIColor?
    var highestScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImage.loadGif(name: "catGif")
    }
    
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
        if sender.currentTitle == "Start Game" {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: UIViewAnimationOptions.curveEaseIn,
                           animations: {
                                self.performSegue(withIdentifier: "toGameScreen", sender: nil)
                           },
                           completion: nil)
        }
    }
}
