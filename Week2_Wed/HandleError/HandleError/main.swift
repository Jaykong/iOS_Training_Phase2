//
//  main.swift
//  HandleError
//
//  Created by trainer on 1/12/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import Foundation

enum InvalidAge:ErrorType {
    case LessThanZero
    case MoreThan150
}

func canThrow(age:Int) throws ->String {
    if age < 0 {
        throw InvalidAge.LessThanZero
    }
    if age > 150 {
        throw InvalidAge.MoreThan150
    }
    return "HumanType"
}


do {
let species = try canThrow(151)
print("you are a \(species)")
} catch {
    print(error)
}

do {
    let species = try canThrow(151)
    print("you are a \(species)")
} catch(InvalidAge.LessThanZero) {
    print(InvalidAge.LessThanZero)
} catch(InvalidAge.MoreThan150) {
    print(InvalidAge.MoreThan150)
}

let species1 = try? canThrow(1)

print(species1)
var species:String?
do {
    species = try canThrow(-1)
    
} catch {
   species = nil
}
print(species)


