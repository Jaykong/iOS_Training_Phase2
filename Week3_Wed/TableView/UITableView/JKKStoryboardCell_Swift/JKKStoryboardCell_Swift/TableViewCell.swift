//
//  TableViewCell.swift
//  JKKStoryboardCell_Swift
//
//  Created by trainer on 1/21/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
