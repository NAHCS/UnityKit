//
//  GameScene.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/8/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
    Provides the base for many features of UnityKit, like managing and updating entities, handling physics
    events, and updating the `Time` class.
*/
open class GameScene: SKScene {

	// MARK: - Scene Logic

    /**
        Sets up basic scene functionality. Must call `super.didMove(to: view)` from subclass.
     
        - Parameter view: the `SKView` that was moved to.
    */
	override open func didMove(to view: SKView) {

        super.didMove(to: view)

        self.physicsWorld.gravity = CGVector.zero
        self.physicsWorld.contactDelegate = self
		backgroundColor = SKColor.black
	}

    /**
        Called once per frame. Updates timing information, and updates all registered entities.
        
        - Parameter currentTime: the current time as a `TimeInterval`.
     */
	override open func update(_ currentTime: TimeInterval) {

        super.update(currentTime)

        // update time
        Time.time = currentTime

        // update entities
        for e in entities {
            e.update(deltaTime: Time.deltaTime)
        }
	}

    // MARK: - Entity Management

    /// The `GameEntity` objects registered with this scene
    internal var entities = Set<GameEntity>()

    /**
        Adds the entity's node with the scene heirarchy, and inserts the entity into a set
        of all registered `GameEntity` objects.

        - Parameter entity: the `GameEntity` to add to the scene.
    */
    public func addEntity(_ entity: GameEntity) {

        addChild(entity.node)
        entities.insert(entity)
    }

    /**
        Removes the entity's node with the scene heirarchy, and removes the entity from the
        set of all registered `GameEntity` objects.

        - Parameter entity: the `GameEntity` to add to the scene.
    */
    public func removeEntity(_ entity: GameEntity) {

        entity.node.removeFromParent()
        entities.remove(entity)
    }

    // TODO: - Touches: Spin this out into dedicated system.

    public var touchOrigin: CGPoint?
    public var currentTouch: CGPoint?
    func touchDown(atPoint pos: CGPoint) {

        touchOrigin = pos
        currentTouch = pos
    }
    func touchMoved(toPoint pos: CGPoint) {

        currentTouch = pos
    }
    func touchUp(atPoint pos: CGPoint) {

        touchOrigin = nil
        currentTouch = nil
    }
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}

// MARK: - SKPhysicsContactDelegate implementation

extension GameScene : SKPhysicsContactDelegate {

    /**
        Implementation of method from `SKPhysicsContactDelegate` prototcol. Passes information on to `PhysicsEvents` class.
    */
	public func didBegin(_ contact: SKPhysicsContact) {

        PhysicsEvents.contactBegan(contact)
	}

    /**
        Implementation of method from `SKPhysicsContactDelegate` prototcol. Passes information on to `PhysicsEvents class.
    */
    public func didEnd(_ contact: SKPhysicsContact) {

        PhysicsEvents.contactEnded(contact)
    }
}
