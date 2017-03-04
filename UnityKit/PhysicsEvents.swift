//
//  PhysicsEvents.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import SpriteKit

/*
	All physics bodies part of a `PhysicsComponent` are registered with `PhysicsEvents`, which receives
	and dispatches physics events to `PhysicsComponent` objects.
*/
class PhysicsEvents {

	/// A dictionary that links an `SKPhysicsBody` to it's `PhysicsComponent`.
	static var registeredBodies = [SKPhysicsBody: PhysicsComponent]()

	/**
		Registers a 'SKPhysicsBody' with the given 'PhysicsComponent'.

		- Parameter body: the `SKPhysicsBody` being registered.
		- Parameter physicsComponent: the `PhysicsComponent` that `body	 is being associated with.
	*/
	static func registerPhysicsBody(_ body: SKPhysicsBody, with physicsComponent: PhysicsComponent) {

		registeredBodies[body] = physicsComponent
	}

	/**
		Unregisters a 'SKPhysicsBody' from the physics event system.

		- Parameter body: the `SKPhysicsBody` being unregistered.
	*/
	static func unregisterPhysicsBody(_ body: SKPhysicsBody) {

		registeredBodies.removeValue(forKey: body)
	}

	/**
		Static function that tells the event system that contact began with a body, and sends notifications
		to all bodies involved that are registered.
	
		- Parameter contact: the SKPhysicsContact information.
	*/
	static func contactBegan(_ contact: SKPhysicsContact) {

		registeredBodies[contact.bodyA]?.madeContact(with: contact.bodyB)
		registeredBodies[contact.bodyB]?.madeContact(with: contact.bodyA)
	}

	/**
		Static function that tells the event system that contact ended with a body, and sends notifications
		to all bodies involved that are registered.

		- Parameter contact: the SKPhysicsContact information.
	*/
	static func contactEnded(_ contact: SKPhysicsContact) {

		registeredBodies[contact.bodyA]?.endedContact(with: contact.bodyB)
		registeredBodies[contact.bodyB]?.endedContact(with: contact.bodyA)
	}
}
