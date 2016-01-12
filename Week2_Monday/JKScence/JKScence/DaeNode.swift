//
//  DaeNode.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
class DaeNode: NSObject {
    
    //从COLLADA文件加载数据
    static func daeDataFromResource(name:String,type:String) -> SCNSceneSource {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: type)
        let daeSource = SCNSceneSource(URL: url!, options: nil)
        return daeSource!
    }
    static func nodeInDae() -> SCNNode?{
        let daeSource = DaeNode.daeDataFromResource("Critter", type: "dae")
        let node = daeSource.entryWithIdentifier("Critter", withClass: SCNNode.self)
        if node != nil {
            node?.position = SCNVector3(5, 0, 0)
         return node
        } else {
            return nil
    }
        
    }
}
