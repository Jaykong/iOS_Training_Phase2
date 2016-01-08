//
//  MenuScene.swift
//  SpriteKitTest
//
//  Created by trainer on 1/7/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import SpriteKit
class MenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        let skLblNode = SKLabelNode(text: "Welcome to Game")
        skLblNode.fontSize = 24
        skLblNode.position = CGPoint(x: size.width/2, y: size.height/2)
        self.addChild(skLblNode)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        let transition = SKTransition.moveInWithDirection(.Left, duration: 0.5)
        self.view?.presentScene(gameScene, transition: transition)

    }
    
}
