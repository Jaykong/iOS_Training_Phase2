//
//  LabelScene.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/7/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SpriteKit

class LabelScene: SKScene {
    override func didMoveToView(view: SKView) {
      let skLblNode = ActionNode(text: "Wecome to Sprite Game")
        skLblNode.fontSize = 24
        skLblNode.fontName = "Zapfino"
        skLblNode.color = UIColor.blueColor()
        skLblNode.position = CGPoint(x: size.width/2, y: size.height/2)
        // MARK: Move Action
        //skLblNode.runMoveAction()
        // MARK: Rotate Action
       // skLblNode.runRotationAction()
        // MARK: Scale Action
       // skLblNode.runScaleAction()
        // MARK: Run Group Action
        skLblNode.runGroupAction()
     self.addChild(skLblNode)
    }
 
 
}


