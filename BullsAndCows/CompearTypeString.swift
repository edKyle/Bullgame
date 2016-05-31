//
//  CompearTypeString.swift
//  BullsAndCows
//
//  Created by Kyle on 2016/5/30.
//  Copyright © 2016年 Brian. All rights reserved.
//
// 不要讓使用者輸入相同的數字
import UIKit

class CompearTypeString: NSObject {
    
    let guessString1:Character
    let guessString2:Character
    let guessString3:Character
    let guessString4:Character
    var compear:[Character] = []
    
    init(guessString1:Character, guessString2:Character, guessString3:Character, guessString4:Character){
        self.guessString1 = guessString1
        self.guessString2 = guessString2
        self.guessString3 = guessString3
        self.guessString4 = guessString4
        self.compear = [guessString1]
    }
    
    func compearmethod()->Bool{
        
        if guessString2 != compear[0]{
            compear.append(guessString2)
        }else{
            
            return true
        }
        if guessString3 != compear[0] && guessString3 != compear[1]{
            compear.append(guessString3)
        }else{
            
            return true
        }
        if guessString4 != compear[0] && guessString4 != compear[1] && guessString4 != compear[2]{
            compear.append(guessString4)
        }else{
            
            return true
        }
        
        return false
    }
    
}
