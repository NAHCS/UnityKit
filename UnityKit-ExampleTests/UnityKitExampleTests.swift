//
//  UnityKit_ExampleTests.swift
//  UnityKit-ExampleTests
//
//  Created by Jak Tiano on 2/19/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import Quick
import Nimble
import UnityKit
import SpriteKit
@testable import UnityKit_Example

class UnityKitExampleTests: QuickSpec {

    override func spec () {
        
        var gameViewController: GameViewController!
        var scene: GameScene!
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            gameViewController = storyboard.instantiateInitialViewController() as! GameViewController
            let _ = gameViewController.view
            scene = gameViewController.scene
        }

        describe("gameEntity") {
            
            var entity: GameEntity!
            beforeEach {
                entity = GameEntity()
                entity.node.name = "New Entity"
            }
            
            context("when added to the scene") {
                beforeEach {
                    scene.addEntity(entity)
                }
                
                it("creates a node as a child of the scene") {
                    expect(scene.childNode(withName: "New Entity")).toNot(beNil())
                }
            }
        }
    }
}
