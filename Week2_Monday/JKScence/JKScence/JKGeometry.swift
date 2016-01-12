//
//  JKGeometry.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
class JKGeometry: NSObject {
    
    static func pyramid()->SCNNode {
       let pyramid = SCNPyramid(width: 0.5, height: 0.9, length: 4.0)
       let pyramidNode = SCNNode(geometry: pyramid)
        pyramidNode.position = SCNVector3(-5, 0, 0)
        
        return pyramidNode
    }
    //增加约束
    static func addConstraint(fromNode:SCNNode,toNode:SCNNode) {
        let lookAtConstraint = SCNLookAtConstraint(target: toNode)
        lookAtConstraint.gimbalLockEnabled = true
        fromNode.constraints = [lookAtConstraint]
    }
}
