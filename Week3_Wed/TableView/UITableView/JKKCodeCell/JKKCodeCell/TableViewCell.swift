//
//  TableViewCell.swift
//  JKKCodeCell
//
//  Created by trainer on 1/20/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var label :UILabel!
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
    let width = UIScreen.mainScreen().bounds.size.width
    label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: self.bounds.size.height))
    
    label.backgroundColor = UIColor.blueColor()
    label.textColor = UIColor.whiteColor()
    self.contentView.addSubview(label)
    
    }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
