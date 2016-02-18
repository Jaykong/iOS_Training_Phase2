//
//  TextViewCell.swift
//  JKFeedbackInClass
//
//  Created by trainer on 2/17/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {

    @IBOutlet weak var textfield: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.greenColor()
        //textfield.backgroundColor = UIColor.grayColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
