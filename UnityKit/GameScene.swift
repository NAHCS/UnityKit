//
//  GameScene.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/8/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit
import GameplayKit

open class GameScene: SKScene {
	
	// MARK: - Scene Logic
	
	override open func didMove(to view: SKView) {
		
        self.physicsWorld.gravity = CGVector.zero
        self.physicsWorld.contactDelegate = self
		backgroundColor = SKColor.black
	}
	override open func update(_ currentTime: TimeInterval) {
		
        super.update(currentTime)
        
        // update time
        Time.time = currentTime
        
        // update entities
        for e in entities {
            e.update(deltaTime: Time.deltaTime)
        }
	}
	
	// MARK: - Touches
	
	public var touchOrigin: CGPoint?
	public var currentTouch: CGPoint?
	
	func touchDown(atPoint pos : CGPoint) {

		touchOrigin = pos
		currentTouch = pos
	}
	func touchMoved(toPoint pos : CGPoint) {
		
		currentTouch = pos
	}
	func touchUp(atPoint pos : CGPoint) {

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
    
    
    // MARK: - Entity Management
    
    var entities = Set<GameEntity>()
    
    public func addEntity(_ entity: GameEntity) {
        
        addChild(entity.node)
        entities.insert(entity)
    }
    public func removeEntity(_ entity: GameEntity) {
        
        entity.node.removeFromParent()
        entities.remove(entity)
    }
}

extension GameScene : SKPhysicsContactDelegate {
    
	public func didBegin(_ contact: SKPhysicsContact) {
        
        PhysicsEvents.contactBegan(contact)
	}
    public func didEnd(_ contact: SKPhysicsContact) {
        
        PhysicsEvents.contactEnded(contact)
    }
}
