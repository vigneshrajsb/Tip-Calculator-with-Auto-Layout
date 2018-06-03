//
//  Data.swift
//  Tip Calculator with Auto Layout
//
//  Created by Vigneshraj Sekar Babu on 6/2/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import Foundation

class Data {
    var totalWithoutTip : Float = 0.0
    var percent : Float = 0.0
    
    var tip : Float {
        var amnt = ((percent/100)*totalWithoutTip * 100) / 100
        //return ((amnt * 4.00)/4.00)
       // print(amnt)
        amnt = amnt -  amnt.remainder(dividingBy: 0.25)
      //  print(amnt)
        return amnt
    }
    
    var totalWithTip : Float {
        return totalWithoutTip + tip
    }
    
}
