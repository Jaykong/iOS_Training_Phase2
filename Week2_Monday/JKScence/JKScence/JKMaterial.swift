//
//  JKMaterial.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit
class JKMaterial: SCNMaterial {
    //向胶囊应用一个有光泽的金属表面
    func redMaterial() {
        self.diffuse.contents = UIColor.redColor()
        self.specular.contents = UIColor.whiteColor()
        self.shininess = 1.0
    }
  //实现粗糙法线贴图，使胶囊像轻轻打过一样
    func textureMaterial(noiseTexture:SKTexture? = SKTexture(noiseWithSmoothness: 0.25, size: CGSize(width: 512, height: 512), grayscale: true)){
    let noiseNormalMapTexture = noiseTexture?.textureByGeneratingNormalMapWithSmoothness(0.5, contrast: 2)
    self.normal.contents = noiseNormalMapTexture
    self.diffuse.contents = noiseTexture
  }
    
    
}
