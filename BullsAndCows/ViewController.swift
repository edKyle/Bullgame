//
//  ViewController.swift
//  BullsAndCows
//
//  Created by Brian Hu on 5/19/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var answearLabel: UILabel!
    var remainingTime: UInt8! {
        didSet {
            remainingTimeLabel.text = "remaining time: \(remainingTime)"
            if remainingTime == 0 {
                guessButton.enabled = false
            } else {
                guessButton.enabled = true
            }
            if remainingTime <= 6{
                remainingTimeLabel.textColor = UIColor.yellowColor()
            }
            if remainingTime <= 3{
                remainingTimeLabel.textColor = UIColor.redColor()
            }
            
        }
    }
    
    var hintArray = [(guess: String, hint: String)]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // TODO: 1. decide the data type you want to use to store the answear
    var answear: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
    }

    let randoGenerate = Randomanswer()
    
    func setGame() {
        
        self.answear = randoGenerate.generateAnswear()
        self.remainingTime = 9
        self.hintArray.removeAll()
        self.answearLabel.text = nil
        self.guessTextField.text = nil
        self.remainingTimeLabel.textColor = UIColor.blackColor()
    }
    
        
    @IBAction func guess(sender: AnyObject) {
        
        let guessString = guessTextField.text
        guessTextField.text = nil
        
        guard guessString?.characters.count == 4 else {
            let alert = UIAlertController(title: "you should input 4 digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let compearTypeString = CompearTypeString(guessString1: guessString![(guessString?.startIndex.advancedBy(0))!], guessString2: guessString![(guessString?.startIndex.advancedBy(1))!], guessString3: guessString![(guessString?.startIndex.advancedBy(2))!], guessString4: guessString![(guessString?.startIndex.advancedBy(3))!])
    
        
        if compearTypeString.compearmethod(){
        
            let alert = UIAlertController(title: "do not guess the same number", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }

        let countAB = CountAB()
        
        countAB.compearAB(guessString!, answear: answear)
        
        // TODO: 4. update the hint
        let hint = "\(countAB.countA)A\(countAB.countB)B"
        
        hintArray.append((guessString!, hint))
        
        // TODO: 5. update the constant "correct" if the guess is correct
        var correct = false
        
        if countAB.countA == 4{
            correct = true
        }
        
        if correct {
            let alert = UIAlertController(title: "Wow! You are awesome!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            guessButton.enabled = false
        } else {
            remainingTime! -= 1
        }
    }
    @IBAction func showAnswear(sender: AnyObject) {
        // TODO: 6. convert your answear to string(if it's necessary) and display it
        answearLabel.text = self.answear
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        setGame()
    }
    
    // MARK: TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hintArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Hint Cell", forIndexPath: indexPath)
        let (guess, hint) = hintArray[hintArray.count - 1 - indexPath.row]
        cell.textLabel?.text = "\(guess) => \(hint)"
        return cell
    }
}

