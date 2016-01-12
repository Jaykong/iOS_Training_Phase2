//
//  JKSCNFloor.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
class JKSCNFloor: NSObject {
    static func addFloorToScene(scene:SCNScene) {
    let floor = SCNFloor()
    let floorNode = SCNNode(geometry: floor)
    floorNode.position = SCNVector3(x: 0, y: -4, z: 0)
    
    let floorPhysicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Static, shape: SCNPhysicsShape(geometry: floor, options: nil))
    floorNode.physicsBody = floorPhysicsBody
    
    scene.rootNode.addChildNode(floorNode)
    
    }
}
