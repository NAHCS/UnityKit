//
//  TestComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 2/19/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import SpriteKit
import UnityKit

class TestComponent: GameComponent {
    
    var isAwake = false
    var hasEnteredCollision = false
    var hasExitedCollision = false
}

extension TestComponent: AwakeableComponent {
    
    func awake() {
        
        isAwake = true
    }
}

extension TestComponent: PhysicsEventComponent {
    
    func onCollisionEnter(body: SKPhysicsBody) {
        
        hasEnteredCollision = true
    }
    func onCollisionExit(body: SKPhysicsBody) {
        
        hasExitedCollision = true
    }
}
