//
//  GameEntity.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

open class GameEntity: GKEntity {

    public var node = SKNode()
    public var gameEntity = self

    // component management
    public var physicsComponents = [PhysicsEventComponent]()

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
        if let c = component as? PhysicsEventComponent {
            physicsComponents.append(c)
        }
        super.addComponent(component)
    }
}
