//
//  SpriteComponent.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

class SpriteComponent : NodeComponent {
    
    init(texture: SKTexture) {
        super.init()
        node = SKSpriteNode(texture: texture)
    }
    
    convenience init(imageNamed imageName: String) {
        let texture = SKTexture(imageNamed: imageName)
        self.init(texture: texture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
