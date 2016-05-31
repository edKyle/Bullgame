//
//  CountAB.swift
//  BullsAndCows
//
//  Created by Kyle on 2016/5/30.
//  Copyright © 2016年 Brian. All rights reserved.
//
// 比較使用者輸入數字跟隨機產生的數字有什麼不一樣

import UIKit

class CountAB: NSObject {
    
    var countA = 0
    var countB = 0
    
    func compearAB(guessString:String, answear:String){
        
        if guessString[(guessString.startIndex.advancedBy(0))] == answear[(answear.startIndex.advancedBy(0))]{
            countA += 1
        }
        
        if guessString[(guessString.startIndex.advancedBy(1))] == answear[(answear.startIndex.advancedBy(1))]{
            countA += 1
        }
        
        if guessString[(guessString.startIndex.advancedBy(2))] == answear[(answear.startIndex.advancedBy(2))]{
            countA += 1
        }
        
        if guessString[(guessString.startIndex.advancedBy(3))] == answear[(answear.startIndex.advancedBy(3))]{
            countA += 1
        }else {
            for i in 0...3{
                if guessString[(guessString.startIndex.advancedBy(0))] == answear[(answear.startIndex.advancedBy(i))] &&
                guessString[(guessString.startIndex.advancedBy(0))] != answear[(answear.startIndex.advancedBy(0))]{
                    countB += 1
                }else if guessString[(guessString.startIndex.advancedBy(1))] == answear[(answear.startIndex.advancedBy(i))] && guessString[(guessString.startIndex.advancedBy(1))] != answear[(answear.startIndex.advancedBy(1))]{
                    countB += 1
                }else if guessString[(guessString.startIndex.advancedBy(2))] == answear[(answear.startIndex.advancedBy(i))] && guessString[(guessString.startIndex.advancedBy(2))] != answear[(answear.startIndex.advancedBy(2))]{
                    countB += 1
                }else if guessString[(guessString.startIndex.advancedBy(3))] == answear[(answear.startIndex.advancedBy(i))] && guessString[(guessString.startIndex.advancedBy(3))] != answear[(answear.startIndex.advancedBy(3))]{
                    countB += 1
                }
                
                
                
            }
        }
    }
}






