//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by trainer on 1/7/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import SpriteKit
class GameScene: SKScene {
    override func didMoveToView(view: SKView) {

        let spriteNode = SKSpriteNode(imageNamed: "pp")
        spriteNode.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        self.addChild(spriteNode)
        
        let texture = SKTexture(imageNamed: "pp")
        let rect = CGRect(x: size.width/2, y: size.height/2, width: 1, height: 1)
        let subTexture = SKTexture(rect: rect, inTexture: texture)
        let skTextureNode = SKSpriteNode(texture: subTexture)
        skTextureNode.position = CGPoint(x: 0, y: size.height)
        self.addChild(skTextureNode)
        
    }
}
