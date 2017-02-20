//
//  SpriteComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

open class SpriteComponent: NodeComponent {

    public init(texture: SKTexture) {

        super.init()
        node = SKSpriteNode(texture: texture)
    }

    convenience public init(imageNamed imageName: String) {

        let texture = SKTexture(imageNamed: imageName)
        self.init(texture: texture)
    }

    required public init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
}
