//
//  ViewController.swift
//  JKScence
//
//  Created by kongyunpeng on 1/8/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//


//MARK: SCNVector3
//SCNVector3是原点是在中心点，x轴向右,y轴向上,z轴向外
import UIKit
import SceneKit
class ViewController: UIViewController {
    var delegate:TapRecognizerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        let scnView = self.view as! SCNView
        scnView.backgroundColor = UIColor.grayColor()
        
        let scene = self.scene()
        scnView.scene = scene
        
        let cameraNode = self.cameraNode()
        scene.rootNode.addChildNode(cameraNode)
        
        let capsuleNode = self.capsuleNode()
        capsuleNode.addAnimation(self.moveUpDownAnimation(), forKey: "updown")
        let textNode = self.textNode()
        capsuleNode.addChildNode(textNode)
        textNode.addAnimation(self.rotateAnimation(), forKey: "rotation")
        scene.rootNode.addChildNode(capsuleNode)
        
        
        
        let ambientNode = self.ambientNode()
        scene.rootNode.addChildNode(ambientNode)
        
        let omniLightNode = self.omniLightNode()
        scene.rootNode.addChildNode(omniLightNode)
        
     let tapRecognizer = TapRecognizer()
        tapRecognizer.addTapRecognizer(self, view: scnView)
        
     let pyramid = JKGeometry.pyramid()
        JKGeometry.addConstraint(pyramid, toNode: capsuleNode)
        scene.rootNode.addChildNode(pyramid)
        
    let critterNode = DaeNode.nodeInDae()
    scene.rootNode.addChildNode(critterNode!)
        
    //添加物理仿真
  let critterBody = JKPhysicBody.jkPhysicBody(critterNode!)
  critterNode?.physicsBody = critterBody
        
   //添加地板
       JKSCNFloor.addFloorToScene(scene)
        
      
    }
    func tapped(tap:UITapGestureRecognizer) {
        let scnView = self.view as! SCNView
        delegate?.didTapped(tap, scnView: scnView)
    }
   //MARK:Camera Node 创建照相机节点
    func camera() -> SCNCamera {
        let camera = SCNCamera()
        camera.xFov = 45
        camera.yFov = 45
        return camera
    }
    
    func cameraNode() -> SCNNode {
        let cameraNode = SCNNode()
        let camera = self.camera()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 20)
        return cameraNode
    }
    //MARK:创建场景
    func scene() -> SCNScene {
        let scene = SCNScene()
        return scene
    }
    
    //MARK:Capsule Node 创建胶囊几何体节点
    func capsule() -> SCNCapsule {
        let capsule = SCNCapsule(capRadius: 2.5, height: 10)
        
        return capsule
    }
    
    func capsuleNode() -> SCNNode {
        let material = JKMaterial()
       // material.redMaterial()
        material.textureMaterial()
        let capsule = self.capsule()
        capsule.materials = [material]
        let capsuleNode = SCNNode(geometry: capsule)
       
        capsuleNode.position = SCNVector3(x: 0, y: 0, z: 0)
        return capsuleNode
    }
    
   //MARK:Ambient Light Node 创建环境光源节点
    func ambientLight() -> SCNLight {
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = UIColor(white: 0.25, alpha: 1)//UIColor.greenColor()
        //
        return ambientLight
    }
    
    func ambientNode() -> SCNNode {
      let ambientLight = self.ambientLight()
      let ambientNode = SCNNode()
      ambientNode.light = ambientLight
      return ambientNode
    }
   //MARK:Capsule Node 创建泛光源节点 
    func omniLight() -> SCNLight {
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        omniLight.color = UIColor(white: 1, alpha: 1)
        return omniLight
    }
    
    func omniLightNode() -> SCNNode {
        let omniLightNode = SCNNode()
        omniLightNode.light = self.omniLight()
        omniLightNode.position = SCNVector3(x: -5, y: 8, z: 5)
        return omniLightNode
    }
    
    //MARK:实现动画 Move up down animation
    func moveUpDownAnimation() -> CAAnimation {
        let moveUpDownAnimation = CABasicAnimation(keyPath:"position")
        
        moveUpDownAnimation.byValue = NSValue(SCNVector3: SCNVector3(x: 0, y: 5, z: 0))
        moveUpDownAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        moveUpDownAnimation.autoreverses = true
        moveUpDownAnimation.repeatCount = Float.infinity
        moveUpDownAnimation.duration = 2
        return moveUpDownAnimation
    }
    //MARK: 创建文本几何体
    func text() -> SCNText {
        let text = SCNText(string: "SceneKit!", extrusionDepth: 0.2)
        text.font = UIFont.systemFontOfSize(2)
        return text
    }
    func textNode() -> SCNNode {
        let textNode = SCNNode(geometry: self.text())
        textNode.position = SCNVector3(-2, 6, 0)
        return textNode
    }
    
    //MARK:合并动画-为文本加旋转动画
    func rotateAnimation() -> CAAnimation {
        let rotate = CABasicAnimation(keyPath: "eulerAngles")
        rotate.byValue = NSValue(SCNVector3:SCNVector3(x: 0, y: Float(M_PI * 2.0), z: 0))
        rotate.repeatCount = Float.infinity
        rotate.duration = 4
        return rotate
        
    }
   //MARK:
}

