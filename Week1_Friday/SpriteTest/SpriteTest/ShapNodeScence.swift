//
//  ShapNodeScence.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/8/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SpriteKit
class ShapNodeScence: SKScene {
    override func didMoveToView(view: SKView) {
       // self.gaussianBlur()
        self.addWallBody()
        let shapeNode = self.addBezierNode()
         self.addPhysicBody(shapeNode)
    
        let rectShapeNode = self.addRectShapeNode(shapeNode)
        self.addPhysicBody(rectShapeNode)
       // rectShapeNode.physicsBody?.dynamic = false
        // shapeNode.physicsBody?.dynamic = false
        
        let shapeBody = SKPhysicsBody(rectangleOfSize: shapeNode.frame.size)
        shapeBody.dynamic = false
        shapeNode.physicsBody = shapeBody
        
        let rectBody = SKPhysicsBody(rectangleOfSize: rectShapeNode.frame.size)
        rectShapeNode.physicsBody = rectBody
        
        let pinJoint = SKPhysicsJointPin.jointWithBodyA(shapeNode.physicsBody!, bodyB: rectShapeNode.physicsBody!, anchor: shapeNode.position)
        self.physicsWorld.addJoint(pinJoint)
        
        let rotateAction = SKAction.rotateByAngle(CGFloat(M_PI), duration: 1)
        let repeatAction = SKAction.repeatActionForever(rotateAction)
       // rectShapeNode.runAction(repeatAction)
        
        // let pinJoint = SKPhysicsJointPin.jointWithBodyA(shapeNode.physicsBody!, bodyB: rectShapeNode.physicsBody!, anchor:shapeNode.position
        //let shapeNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 50, height: 50), cornerRadius: 10)
//        let shapeNode = SKShapeNode(rectOfSize: CGSize(width: size.width/2 , height: size.height/2))
//        shapeNode.position = CGPoint(x: size.width/2, y: size.height/2)
//        shapeNode.fillColor = UIColor.blueColor()
        //self.addChild(shapeNode)
       //MARK: BezierNode()
       // self.addBezierNode()
        //self.unClosedRectNode()
        
    }
    
    func addRectShapeNode(shapeNode:SKShapeNode) -> SKShapeNode {
        let shapeNode = SKShapeNode(rectOfSize: shapeNode.frame.size)
      shapeNode.position = CGPoint(x:100 , y:200 )
       
        shapeNode.fillColor = UIColor.redColor()
        
        self.addChild(shapeNode)
      return shapeNode
    }
    
    func addWallBody()  {
        let wallBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody = wallBody
    }
    
    func addBezierNode() -> SKShapeNode{
        let path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
        let shapeNodeWithPath = SKShapeNode(path: path.CGPath, centered: true)
        shapeNodeWithPath.position = CGPoint(x: size.width/2, y: size.height/2)
        shapeNodeWithPath.fillColor = UIColor.greenColor()
        shapeNodeWithPath.strokeColor = UIColor.redColor()
        shapeNodeWithPath.lineWidth = 10
        shapeNodeWithPath.glowWidth = 10
        
       self.addChild(shapeNodeWithPath)
        return shapeNodeWithPath
    }
    
    func unClosedRectNode() -> (SKShapeNode,SKShapeNode,SKShapeNode) {
       let topLeftPoint = CGPoint(x: 0, y: 0)
       let bottomLeftPoint = CGPoint(x: 0, y: 100)
       let bottomRightPoint = CGPoint(x: 100, y: 100)
      let path = UIBezierPath()
     path.moveToPoint(topLeftPoint)
     path.addLineToPoint(bottomLeftPoint)
     path.addLineToPoint(bottomRightPoint)
     //path.closePath()
        
        let unClosedNode = SKShapeNode(path: path.CGPath, centered: true)
        unClosedNode.position = CGPoint(x: size.width/2, y: size.height/2)
        unClosedNode.fillColor = UIColor.redColor()
        unClosedNode.lineCap = .Square
        unClosedNode.lineWidth = 40
        unClosedNode.strokeColor = UIColor.greenColor()
       let newNode = unClosedNode.copy() as! SKShapeNode
        newNode.position = CGPoint(x: unClosedNode.position.x - 140, y: unClosedNode.position.y - 140)
        newNode.lineCap = .Round
        
        let newNode2 = unClosedNode.copy() as! SKShapeNode
        newNode2.position = CGPoint(x: unClosedNode.position.x + 140, y: unClosedNode.position.y + 140)
        newNode2.lineCap = .Butt
        self.addChild(newNode2)
        self.addChild(newNode)
        self.addChild(unClosedNode)
        
       return (newNode,newNode2,unClosedNode)
    }
   
    func gaussianBlur() {
        let blurFilter = CIFilter(name: "CIBoxBlur")//CIGaussianBlur
        blurFilter?.setDefaults()
        blurFilter?.setValue(40, forKey: "inputRadius")
        let blurEffectNode = SKEffectNode()
        blurEffectNode.filter = blurFilter
        blurEffectNode.shouldEnableEffects = true
        
        self.addChild(blurEffectNode)
        let bezierNode = self.addBezierNode()
        blurEffectNode.addChild(bezierNode)
        
        // MARK: SKScene SKEffect
//        self.filter = blurFilter
//        self.shouldEnableEffects = true
        
    }
    
    //MARK: add physicBody
    func addPhysicBody(shapeNode:SKShapeNode){
        let body = SKPhysicsBody(rectangleOfSize: shapeNode.frame.size)
        body.mass = 0.0
        shapeNode.physicsBody = body
        self.view?.showsPhysics = true
        
        
    }
}
