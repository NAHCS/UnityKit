//
//  PhysicsComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

public class PhysicsComponent: GameComponent {

    let physicsBody: SKPhysicsBody
    let physicsCategory: UInt32
    let contactMask: UInt32
    let collisionMask: UInt32

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

    required public init?(coder aDecoder: NSCoder) {

        fatalError("GameComponent doesn't support NSCoder")
    }

    func madeContact(with body: SKPhysicsBody) {

        for pc in gameEntity.physicsComponents {
            pc.onCollisionEnter(body: body)
        }
    }
    func endedContact(with body: SKPhysicsBody) {

        for pc in gameEntity.physicsComponents {
            pc.onCollisionExit(body: body)
        }
    }
}

extension PhysicsComponent : AwakeableComponent {

    public func awake() {

        gameEntity.node.physicsBody = physicsBody
        gameEntity.node.physicsBody?.categoryBitMask = physicsCategory
        gameEntity.node.physicsBody?.contactTestBitMask = contactMask
        gameEntity.node.physicsBody?.collisionBitMask = collisionMask
    }
}
