//
//  GameViewController.swift
//  UnityKit-Example
//
//  Created by Jak Tiano on 2/19/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import UIKit
import SpriteKit
import UnityKit

class GameViewController: UIViewController {

    public var scene: TestGameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            
            scene = TestGameScene()
            scene.scaleMode = .aspectFill

            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
