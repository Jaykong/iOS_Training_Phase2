//
//  ActionNode.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/7/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SpriteKit

class ActionNode: SKLabelNode {

    func runMoveAction() -> SKAction {
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy:300), duration: 1)
//     self.runAction(moveAction) { () -> Void in
//        let movebackAction = moveAction.reversedAction()
//        self.runAction(movebackAction, completion: { () -> Void in
//            self.addMoveAction()
//        })
        
     let reverseAction =  moveAction.reversedAction()
      let sequenceAction = SKAction.sequence([moveAction,reverseAction])
   
      let repeatAction = SKAction.repeatActionForever(sequenceAction)
      self.runAction(repeatAction)
        return repeatAction
     }
    func runRotationAction() -> SKAction {
        let rotationAction = SKAction.rotateByAngle(CGFloat(M_PI), duration: 1)
        let repeatAction = SKAction.repeatActionForever(rotationAction)
        self.runAction(repeatAction)
        return repeatAction
    }
    
    func runScaleAction() -> SKAction {
        let scaleLargeAction = SKAction.scaleBy(2.0, duration: 1)
        let scaleBackAction = scaleLargeAction.reversedAction()
        let scaleSmallAction = SKAction.scaleBy(0.5, duration: 1)
        let sequenceAction = SKAction.sequence([scaleLargeAction,scaleBackAction,scaleSmallAction,scaleSmallAction.reversedAction()])
        
        let repeatAction = SKAction.repeatActionForever(sequenceAction)
        self.runAction(repeatAction)
        return repeatAction
    }
    
    func runGroupAction() {
       let moveAction = self.runMoveAction()
       let rotateAction = self.runRotationAction()
       let scaleAction = self.runScaleAction()
       let groupAction = SKAction.group([moveAction,rotateAction,scaleAction])
        self.runAction(groupAction)
        
    }
    
}

