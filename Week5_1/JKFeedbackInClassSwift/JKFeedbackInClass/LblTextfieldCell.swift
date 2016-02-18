//
//  LblTextfieldCell.swift
//  JKFeedbackInClass
//
//  Created by trainer on 2/17/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
var tagCount = 0
class LblTextfieldCell: UITableViewCell {
    @IBOutlet weak var lbl: UILabel!

    @IBOutlet weak var textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.grayColor()
       textfield.tag = tagCount
        ++tagCount
        
}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
