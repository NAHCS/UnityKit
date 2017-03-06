//
//  PhysicsComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

/**
	Subclass of `GameComponent` that receives physics notifications from `PhysicsEvents`
	and then distributes event information to all registered components on parent entity.
*/
public class PhysicsComponent: GameComponent {

	/// The `SKPhysicsBody` that is registered with the physics engine.
	let physicsBody: SKPhysicsBody

	/// The category mask for this physics object.
	let physicsCategory: UInt32

	/// The category masks for physics objects that trigger contact notifications.
	let contactMask: UInt32

	/// The category masks for physics objects that collide with this object.
	let collisionMask: UInt32

	/**
		Creates a new `PhysicsComponent` using provided information, and registers component
		with the `PhysicsEvent` system.
		 
		- Parameter physicsBody: the category mask for this physics object.
		- Parameter physicsCategory: the category masks for physics objects that trigger contact notifications.
		- Parameter contactMask: the coder.
		- Parameter collisionMask: the category masks for physics objects that collide with this object.
	*/
	public init(withBody physicsBody: SKPhysicsBody,
				category physicsCategory: UInt32,
				contactCategories contactMask: UInt32,
				collisionCategories collisionMask: UInt32 ) {

		self.physicsBody = physicsBody
		self.physicsCategory = physicsCategory
		self.contactMask = contactMask
		self.collisionMask = collisionMask

		super.init()

		PhysicsEvents.registerPhysicsBody(self.physicsBody, with: self)
	}

	/**
		Fails, because a `PhysicsComponent` does not support being initialized from a coder.

		- Parameter aDecoder: the coder.
	*/
	required public init?(coder aDecoder: NSCoder) {

		fatalError("GameComponent doesn't support NSCoder")
	}

	/**
		Alerts all eligible components registered with owning entity 
		that contact was made.

		- Parameter body: the physics body that made contact.
	*/
	internal func madeContact(with body: SKPhysicsBody, contact: SKPhysicsContact) {

		for pc in gameEntity.physicsComponents {
			pc.onCollisionEnter(body: body, contact: contact)
		}
	}

	/**
		Alerts all eligible components registered with owning entity
		that contact was ended.

		- Parameter body: the physics body that ended contact.
	*/
	internal func endedContact(with body: SKPhysicsBody, contact: SKPhysicsContact) {

		for pc in gameEntity.physicsComponents {
			pc.onCollisionExit(body: body, contact: contact)
		}
	}
}

/**
	Protocol implementation of AwakeableComponent.
*/
extension PhysicsComponent : AwakeableComponent {

	/**
		Sets owning entity's node's physics body settings.
	*/
	public func awake() {

		gameEntity.node.physicsBody = physicsBody
		gameEntity.node.physicsBody?.categoryBitMask = physicsCategory
		gameEntity.node.physicsBody?.contactTestBitMask = contactMask
		gameEntity.node.physicsBody?.collisionBitMask = collisionMask
	}
}
