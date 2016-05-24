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
        }
    }
    
    var hintArray = [(guess: String, hint: String)]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // TODO: 1. decide the data type you want to use to store the answear
    var answear: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
    }

    func setGame() {
        generateAnswear()
        remainingTime = 9
        hintArray.removeAll()
        answearLabel.text = nil
        guessTextField.text = nil
    }
    
    func generateAnswear()-> [String]{
        // TODO: 2. generate your answear here
        // You need to generate 4 random and non-repeating digits.
        // Some hints: http://stackoverflow.com/q/24007129/938380
        
        var base:[String] = ["0","1","2","3","4","5","6","7","8","9"]
        var rightAnswer:[String] = [String]()
        
        while rightAnswer.count < 4 && base.count > 6{
            
            let number = String(arc4random_uniform(10))
            var n = 0
            for i in base{
                if number == i{
                    let pass = base.removeAtIndex(n)
                    rightAnswer.append(pass)
                }
                n += 1
            }
        }

        return rightAnswer
}
    
    @IBAction func guess(sender: AnyObject) {
        let guessString = guessTextField.text
        guard guessString?.characters.count == 4 else {
            let alert = UIAlertController(title: "you should input 4 digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        // TODO: 3. convert guessString to the data type you want to use and judge the guess
        
        let rightAnswer = generateAnswear()
        let rightAnswer2 = String(rightAnswer)
        
        let correctAnswer = rightAnswer2.componentsSeparatedByString(" ")
        let guessArray = guessString!.componentsSeparatedByString(" ")
        print("correctAnswer\(correctAnswer)")
        print("guessArray\(guessArray)")
        
        var countA = 0
        var countB = 0
        
        if guessArray[0] == correctAnswer[0]{
            countA += 1
        }else{
            for n in correctAnswer{
                if guessArray[0] == n{
                    countB += 1
                }
            }
        }
        
        if guessArray[1] == correctAnswer[1]{
            countA += 1
        }else{
            for n in correctAnswer{
                if guessArray[1] == n{
                    countB += 1
                }
            }
        }

        
        if guessArray[2] == correctAnswer[2]{
            countA += 1
        }else{
            for n in correctAnswer{
                if guessArray[2] == n{
                    countB += 1
                }
            }
        }

        
        if guessArray[3] == correctAnswer[3]{
            countA += 1
        }else{
            for n in correctAnswer{
                if guessArray[3] == n{
                    countB += 1
                }
            }
        }

        
        
        
        
        // TODO: 4. update the hint
        let hint = "\(countA)A\(countB)B"
        
        hintArray.append((guessString!, hint))
        
        // TODO: 5. update the constant "correct" if the guess is correct
        var correct = false
        
        if hint == "4A0B"{
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
        answearLabel.text = "\(answear)"
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
        let (guess, hint) = hintArray[indexPath.row]
        cell.textLabel?.text = "\(guess) => \(hint)"
        return cell
    }
}

