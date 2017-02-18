//
//  GameEntity.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

class GameEntity : GKEntity {
    
    var node = SKNode()
    var gameEntity = self
    
    override func addComponent(_ component: GKComponent) {
        if let c = component as? GameComponent {
            c.gameEntity = self
        }
        if let c = component as? AwakeableComponent {
            c.awake()
        }
        if let c = component as? NodeComponent, let n = c.node {
            node.addChild(n)
        }
        super.addComponent(component)
    }
}
