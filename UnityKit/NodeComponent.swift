//
//  NodeComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

/**
    Subclass of `GameComponent` that specifically contains an SKNode to be added to
    the scene hierarchy when added to an entity.
*/
open class NodeComponent: GameComponent {

    /// An SKNode that will be parented to owning entity.
    internal var node: SKNode? // TODO: Determine if this can be seen in subclasses in other modules
}
