//
//  Fraction.swift
//  UsingSwiftInOC
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import Foundation
//@objc(Fraction)
class Fraction:NSObject {
    var numerator:Int
    var denominator:Int
    init(numerator:Int,denominator:Int){
        self.numerator = numerator
        self.denominator = denominator
    }
}
