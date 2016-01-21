//
//  GridCell.swift
//  NibGridCell
//
//  Created by kongyunpeng on 1/16/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.blueColor()
    }

}
