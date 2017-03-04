//
//  SpriteComponent.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import GameplayKit

/*
	Subclass of NodeComponent that instantiates and manages the node as a SKSpriteNode.
*/
open class SpriteComponent: NodeComponent {

	/// The sprite node that this component controls.
	private var spriteNode: SKSpriteNode!

	/// The color of the sprite.
	public var color: SKColor = SKColor.white {
		didSet {
			spriteNode.color = color
		}
	}

	/// The texture of the sprite.
	public var texture: SKTexture? = nil {
		didSet {
			spriteNode.texture = texture
		}
	}

	/**
		Creates a new `SpriteComponent` with the given texture.

		- Parameter texture: the texture the sprite should be initialized with.
	*/
	public init(texture: SKTexture) {

		super.init()
		node = SKSpriteNode(texture: texture)
		if let sn = node as? SKSpriteNode {
			spriteNode = sn
		}
	}

	/**
		Creates a new `SpriteComponent` from an image name.

		- Parameter imageName: the name of the image that should be used to load an initial texture.
	*/
	convenience public init(imageNamed imageName: String) {

		let texture = SKTexture(imageNamed: imageName)
		self.init(texture: texture)
	}

	/**
		Fails, because a `SpriteComponent` does not support being initialized from a coder.

		- Parameter aDecoder: the coder.
	*/
	required public init?(coder aDecoder: NSCoder) {

		fatalError("init(coder:) has not been implemented")
	}
}
