//
//  PhysicsComponent.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

public class PhysicsComponent : GameComponent, AwakeableComponent {
    
    let physicsBody: SKPhysicsBody
    let physicsCategory: UInt32
    let contactMask: UInt32
    let collisionMask: UInt32
    
    public init(withBody physicsBody: SKPhysicsBody, category physicsCategory: UInt32, contactCategories contactMask: UInt32, collisionCategories collisionMask: UInt32 ) {
        self.physicsBody = physicsBody
        self.physicsCategory = physicsCategory
        self.contactMask = contactMask
        self.collisionMask = collisionMask
        
        super.init()
        
        PhysicsEvents.registerPhysicsBody(self.physicsBody, with: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("GameComponent doesn't support NSCoder")
    }
    
    public func madeContact(with body: SKPhysicsBody) {
        
        print("\(gameEntity.node.name) made contact with \(body.node?.name ?? "unnamed body")")
    }
    
    public func endedContact(with body: SKPhysicsBody) {
        
        print("\(gameEntity.node.name) ended contact with \(body.node?.name ?? "unnamed body")")
    }
    
    public func awake() {
        gameEntity.node.physicsBody = physicsBody
        gameEntity.node.physicsBody?.categoryBitMask = physicsCategory
        gameEntity.node.physicsBody?.contactTestBitMask = contactMask
        gameEntity.node.physicsBody?.collisionBitMask = collisionMask
    }
}
