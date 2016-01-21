//
//  CollectionViewCell.swift
//  CodeCollectionCell
//
//  Created by trainer on 1/16/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
     var label:UILabel! = UILabel()
     override func drawRect(rect: CGRect) {
    print("drawRect")
    }
    override init(frame: CGRect) {
      //label = UILabel(frame: frame)
     //  label.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
   // label = UILabel(frame: frame)
        let inset:CGFloat = 15
        //label.frame = CGRect(x: inset, y: inset, width: frame.size.width - inset * 2, height: frame.size.height - inset * 2)//为什么一定要调用frame才会起到把子视图
        label.textColor = UIColor.redColor()
        label.backgroundColor = UIColor.greenColor()
        label.font = UIFont.systemFontOfSize(35)
       
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellowColor()
        
        print(self.reuseIdentifier)
         self.addSubview(label)
        
        }

    required init?(coder aDecoder: NSCoder) {
        print("coder")
        fatalError("init(coder:) has not been implemented")
    }
    
}
