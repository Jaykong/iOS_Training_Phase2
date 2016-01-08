//
//  SpriteNodeScene.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/8/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SpriteKit
class SpriteNodeScene: SKScene {
    override func didMoveToView(view: SKView) {
      let node = SKSpriteNode(imageNamed: "BlockSquareBlue")
        node.position = CGPoint(x: size.width/2, y: size.height/2)
        node.lightingBitMask = 0x1
        self.addChild(node)
        self.addLightNode()
       // self.addNodeWithConstraint(node)
      
        let shader = self.addShader(node)
       // self.addUniform(shader)
        node.shader = shader
    }
    
    func addLightNode() {
        let light = SKLightNode()
        light.enabled = true
        light.position = CGPoint(x: size.width/2, y: size.height/2)
        light.lightColor = UIColor.greenColor()
        light.categoryBitMask = 0xFFFFFFFF
       
        self.addChild(light)
    }
    
    func addNodeWithConstraint(node:SKSpriteNode) {
        let pointAtConstraint = SKConstraint.orientToNode(node, offset: SKRange(constantValue: 10))
        let frogNode = SKSpriteNode(imageNamed: "frog")
        frogNode.constraints = [pointAtConstraint]
        frogNode.position = node.position
        self.addChild(frogNode)
    }
    
    func addShader(spriteNode:SKSpriteNode) -> SKShader {
        let shader = SKShader(fileNamed: "CustomShader")
        //spriteNode.shader = shader
        return shader
    }
    
    func addUniform(shader:SKShader) {
        let noiseTexture = SKTexture(noiseWithSmoothness: 0.5, size: CGSize(width: 256, height: 265), grayscale: true)
        let textureUniform = SKUniform(name: "noiseTexture", texture: noiseTexture)
        let thresholdUniform = SKUniform(name: "threshold", float: 0.3)
        shader.addUniform(textureUniform)
        shader.addUniform(thresholdUniform)
    }
}
