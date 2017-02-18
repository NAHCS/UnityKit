//
//  GameBehavior.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

open class GameComponent : GKComponent {
    
    public var gameEntity: GameEntity!
}

public protocol AwakeableComponent {
    func awake()
}
