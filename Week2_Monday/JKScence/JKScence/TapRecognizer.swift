//
//  TapRecognizer.swift
//  JKScence
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import SceneKit
protocol TapRecognizerDelegate {
    func didTapped(tapRecognizer:UITapGestureRecognizer,scnView:SCNView)
}

class TapRecognizer: NSObject,TapRecognizerDelegate {
    
   
    func addTapRecognizer(viewController:ViewController,view:SCNView){
    
    let tapRecognizer = UITapGestureRecognizer(target: viewController, action: "tapped:")
    view.addGestureRecognizer(tapRecognizer)
    view.userInteractionEnabled = true
    viewController.delegate = self
    }

    
    func didTapped(tapRecognizer: UITapGestureRecognizer, scnView: SCNView) {
        if tapRecognizer.state == UIGestureRecognizerState.Ended
        {
            let hits = scnView.hitTest(tapRecognizer.locationInView(tapRecognizer.view), options: nil)
            for hit in hits {
                if let theMaterial = hit.node.geometry?.materials[0] {
                    let highlightAnimation = CABasicAnimation(keyPath: "contents")
                    highlightAnimation.fromValue = UIColor.blackColor()
                    highlightAnimation.toValue = UIColor.yellowColor()
                    highlightAnimation.autoreverses = true
                    highlightAnimation.repeatCount = 0
                    highlightAnimation.duration = 1
                    theMaterial.emission.addAnimation(highlightAnimation, forKey: "highlight")
                }
            }
        }
    }
   
}
