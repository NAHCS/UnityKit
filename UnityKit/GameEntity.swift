//
//  GameEntity.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

open class GameEntity: GKEntity {

    public var node = SKNode()
    public var gameEntity: GameEntity!

    // component management
    public var physicsComponents = [PhysicsEventComponent]()

    override public init() {

        super.init()
        gameEntity = self
        node.entity = gameEntity
    }

    public convenience init(name: String) {

        self.init()
        node.name = name
    }

    required public init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    override open func addComponent(_ component: GKComponent) {

        if let c = component as? GameComponent {
            c.gameEntity = self
        }
        if let c = component as? AwakeableComponent {
            c.awake()
        }
        if let c = component as? PhysicsEventComponent {
            physicsComponents.append(c)
        }
        if let c = component as? NodeComponent, let n = c.node {
            node.addChild(n)
        }
        super.addComponent(component)
    }
}

// allow access from a node in place of SKNode.entity
public extension SKNode {
    public var gameEntity: GameEntity? {
        if let e = self.entity as? GameEntity {
            return e
        }
        return nil
    }
}
