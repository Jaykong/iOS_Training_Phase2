//
//  FontName.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/7/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

func getFontName() {
    for fontFamily in UIFont.familyNames()  {
        for fontName in UIFont.fontNamesForFamilyName(fontFamily) {
            print(fontName)
        }
    }
}