//
//  GameEntity.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

open class GameEntity : GKEntity {
    
    public var node = SKNode()
    public var gameEntity = self
    
    override open func addComponent(_ component: GKComponent) {
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
