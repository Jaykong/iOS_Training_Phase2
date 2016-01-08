//
//  ViewController.swift
//  SpriteTest
//
//  Created by kongyunpeng on 1/7/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SpriteKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    // MARK:SKTextureAtlas
//        let atlas = SKTextureAtlas(named: "Sprites")
//        let textureInAtlas = atlas.textureNamed("BlockSquareRed")
//        let blueNode = SKSpriteNode(texture: textureInAtlas)
//        let blueScene = SKScene(size: self.view.bounds.size)
//        blueScene.addChild(blueNode)
//        blueNode.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
//        let skView = self.view as! SKView
//        skView.presentScene(blueScene)
        
      // MARK: GetFontName
       // getFontName()
      // MARK:   SKLabelScene
//      let lblScene = LabelScene(size: self.view.bounds.size)
//      let skView = self.view as! SKView
       // skView.presentScene(lblScene)
        
// MARK: SKShapeScene
//    let shapeScene = ShapNodeScence(size: self.view.bounds.size)
//    let skView = self.view as! SKView
//    skView.presentScene(shapeScene)
        
       // MARK: Sprite Scene
//        let spriteScene = SpriteNodeScene(size: self.view.bounds.size)
//        let skView = self.view as! SKView
//        skView.presentScene(spriteScene)
        
       //MARK: load from GameScence.sks
        let gameScene = SKScene(fileNamed: "GameScence")
        let skView = self.view as! SKView
               skView.presentScene(gameScene)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

