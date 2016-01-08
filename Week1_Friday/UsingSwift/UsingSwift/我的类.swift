//
//  我的类.swift
//  UsingSwift
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//


@objc(MyClass)
class 我的类:NSObject {
    @objc(greeting:)
    func 打招呼(名字:String) {
        print(名字)
    }
}

