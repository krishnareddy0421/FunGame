//
//  GameScreenVC.swift
//  Fun Game
//
//  Created by vamsi krishna reddy kamjula on 11/3/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class GameScreenVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var tapImgView: UIImageView!
    @IBOutlet weak var bottomMenuStack: UIStackView!
    @IBOutlet weak var scoreCountLbl: UILabel!
    @IBOutlet weak var countdownTimerLbl: UILabel!
    
    // MARK:- SetGame View's Outlets
    @IBOutlet var setGameView: UIView!
    @IBOutlet weak var timeDisplayLbl: UILabel!
    
    // MARK: GameOver View's Outlets
    @IBOutlet var gameOverView: UIView!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var bgColor: UIColor?
    var timer = Timer()
    var count = 0
    var seconds = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimerLbl.isHidden = true

        tapImgView.loadGif(name: "tapCat")
        self.changeBgViewColor()
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tapImgView.isUserInteractionEnabled = true
        tapImgView.addGestureRecognizer(tapGesture)

        self.showSetGameView()
    }
    
    func showSetGameView() {
        timeDisplayLbl.text = "You have 60 sec to catch the cat."
        setGameView.center = view.center
        view.addSubview(setGameView)
    }
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        setGameView.removeFromSuperview()
        countdownTimerLbl.isHidden = false
        self.setTheGame()
    }
    
    func setTheGame() {
        seconds = 60
        self.tapImgView.isHidden = false
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideCat), userInfo: nil, repeats: true)
    }
    
    @objc func hideCat() {
        seconds -= 1
        if seconds < 10 {
            countdownTimerLbl.text = "00:0\(seconds)"
        } else {
            countdownTimerLbl.text = "00:\(seconds)"
        }
        if seconds == 0 {
            timer.invalidate()
            countdownTimerLbl.isHidden = true
            self.tapImgView.isHidden = true
            self.bottomMenuStack.isHidden = true
            scoreLbl.text = "Your score is \(count)"
            gameOverView.center = view.center
            view.addSubview(gameOverView)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.changeImgPosition()
            self.count = self.count + 1
            self.scoreCountLbl.text = "Count: \(self.count)"
        }, completion: nil)
        self.changeBgViewColor()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tryAgainBtnPressed(_ sender: UIButton) {
        countdownTimerLbl.isHidden = false
        count = 0
        gameOverView.removeFromSuperview()
        setTheGame()
        self.tapImgView.isHidden = false
        self.bottomMenuStack.isHidden = false
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.scoreCountLbl.text = "Count: \(self.count)"
            self.changeImgPosition()
        }, completion: nil)
    }
    
    func changeImgPosition() {
        let xValue = CGFloat(arc4random_uniform(UInt32(self.gameView.bounds.width)))
        let yValue = CGFloat(arc4random_uniform(UInt32(self.gameView.bounds.height)))
        self.tapImgView.center = CGPoint(x: xValue, y: yValue)
    }
    
    func changeBgViewColor() {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.gameView.backgroundColor = self.bgColor
        }
    }
}
