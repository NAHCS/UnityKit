//
//  GameBehavior.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

/**
	Subclasses `GKComponent` to add a reference to an owning `GameEntity` object.
*/
open class GameComponent: GKComponent {

	/// The `GameEntity` that owns this component.
	public var gameEntity: GameEntity!
}

/**
	Defines a protocol for a component that is awoken when added to an entity.
*/
public protocol AwakeableComponent {

	/// Called once when a component is added to a `GameEntity` object.
	func awake()
}

/**
	Defines a protocol for a component that recevies physics notification events.
*/
public protocol PhysicsEventComponent {

	/// Called when another body enters this entity's physics body.
	func onCollisionEnter(body: SKPhysicsBody, contact: SKPhysicsContact)

	/// Called when another body exits this entity's physics body.
	func onCollisionExit(body: SKPhysicsBody, contact: SKPhysicsContact)
}
