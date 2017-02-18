//
//  GameBehavior.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

class GameComponent : GKComponent {
    
    var gameEntity: GameEntity!
}

protocol AwakeableComponent {
    func awake()
}
