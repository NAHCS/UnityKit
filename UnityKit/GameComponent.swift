//
//  GameBehavior.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

open class GameComponent: GKComponent {

    public var gameEntity: GameEntity!
}

public protocol AwakeableComponent {

    func awake()
}

public protocol PhysicsEventComponent {

    func onCollisionEnter(body: SKPhysicsBody)
    func onCollisionExit(body: SKPhysicsBody)
}
