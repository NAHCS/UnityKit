//
//  TestGameScene.swift
//  UnityKit
//
//  Created by Jak Tiano on 3/4/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import SpriteKit
import UnityKit

public class TestGameScene: GameScene {

	public override func didMove(to view: SKView) {
		super.didMove(to: view)
		self.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
	}
}
