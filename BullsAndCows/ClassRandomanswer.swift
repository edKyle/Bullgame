//
//  Randomanswer.swift
//  BullsAndCows
//
//  Created by Kyle on 2016/5/30.
//  Copyright © 2016年 Brian. All rights reserved.
//

import UIKit

class classRandomanswer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateAnswear()->String{
        // TODO: 2. generate your answear here
        // You need to generate 4 random and non-repeating digits.
        // Some hints: http://stackoverflow.com/q/24007129/938380
        
        var base:[String] = ["0","1","2","3","4","5","6","7","8","9"]
        var rightAnswer:[String] = [String]() // []
        
        while rightAnswer.count < 4 {
            
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
        
        return rightAnswer.joinWithSeparator("")
    }

}

