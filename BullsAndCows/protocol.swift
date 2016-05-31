//
//  protocol.swift
//  BullsAndCows
//
//  Created by Kyle on 2016/5/31.
//  Copyright © 2016年 Brian. All rights reserved.
//

import UIKit

protocol Game{

    func setGame()
    func generateAnswear()
    func guess(sender: AnyObject)
    var answear:String?{get}
    
}
