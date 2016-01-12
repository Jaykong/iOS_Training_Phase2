//
//  JKPhysicBody.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
class JKPhysicBody: NSObject {
    static func jkPhysicBody(node:SCNNode) -> SCNPhysicsBody {
        var physicsShape:SCNPhysicsShape?
        if let geometry = node.geometry {
            physicsShape = SCNPhysicsShape(geometry: geometry, options: nil)
        }
       let physicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Dynamic, shape: physicsShape)
       return physicsBody
    }
}
