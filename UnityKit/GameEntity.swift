//
//  GameEntity.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

/**
    Subclasses `GKEntity` to hijack the entity-component system to allow for more complex behaviors,
    such as receiving physics events, awakeability, and node ownership in components.
*/
open class GameEntity: GKEntity {

    /// A reference to itself.
    public var gameEntity: GameEntity!

    /// The entity's associated node.
    public var node = SKNode()

    /// The registered components that can receive physics events.
    public var physicsComponents = [PhysicsEventComponent]()

    /**
        Creates an empty `GameEntity` with a reference to itself, and an empty `SKNode` which also has
        a reference to the new game entity.
    */
    override public init() {

        super.init()
        gameEntity = self
        node.entity = gameEntity
    }
    /**
        Creates an empty `GameEntity`, but also assigns a name to the node.

        - Parameter name: the name to assign to the new entity's node.
    */
    public convenience init(name: String) {

        self.init()
        node.name = name
    }
    /**
        Delegates initialization to the default initializer.
         
        - Parameter aDecoder: the coder.
    */
    required public convenience init?(coder aDecoder: NSCoder) {

        self.init()
    }

    /**
        Adds the compononet to the entity using the `GameplayKit` base framework, but also checks to see if
        the component has other features.

        Additional types of components supported:
        - `GameComponent`: The base class of `UnityKit` components. Gives a `GameComponent` a reference to this `GameEntity` object.
        - `AwakeableComponent`: A component that conforms to `AwakeableComponent` will have its `awake()` function called.
        - `PhysicsEventComponent`: A component that conforms to `PhysicsEventComponent` will be registered to the `GameEntity` object's physicsComponent array.
        - `NodeComponent`: A component derived from `NodeComponent` will have its node added to the `GameEntity` object's node hierarchy.

        - Parameter name: the name to assign to the new entity's node.
    */
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
