//
//  SKNode+GameEntity.swift
//  UnityKit
//
//  Created by Jak Tiano on 2/20/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import SpriteKit

/**
    Extends SKNode to add a computed property for a `GameEntity` reference.
*/
public extension SKNode {

    /// Returns a node's `entity` as a `GameEntity` if valid.
    public var gameEntity: GameEntity? {
        if let e = self.entity as? GameEntity {
            return e
        }
        return nil
    }
}
