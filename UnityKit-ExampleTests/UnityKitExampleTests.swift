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
@testable import UnityKit_Example

class GameEntityTests: QuickSpec {

    override func spec () {
        
        var gameViewController: GameViewController!
        var scene: GameScene!
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            gameViewController = storyboard.instantiateInitialViewController() as! GameViewController
            let _ = gameViewController.view
            scene = gameViewController.scene
        }

        describe("a GameEntity") {
            
            let entityName = "New Entity"
            var entity: GameEntity!
            beforeEach {
                entity = GameEntity(name: entityName)
            }
            
            context("when added to the scene") {
                
                beforeEach {
                    scene.addEntity(entity)
                }
                
                it("creates a node as a child of the scene") {
                    expect(scene.childNode(withName: entityName)).toNot(beNil())
                }
                it("has a node that points back to the GameEntity") {
                    expect(entity.node.gameEntity).to(be(entity))
                }
                it("has a pointer to itself") {
                    expect(entity.gameEntity).to(be(entity))
                }
            }
            
            describe("its GameComponent") {
                
                it("has reference to owner GameEntity") {
                    let component = GameComponent()
                    entity.addComponent(component)
                    expect(component.gameEntity).to(be(entity))
                }
            }
            
            describe("its AwakeableComponent") {
                
                it("wakes up") {
                    let component = TestComponent()
                    entity.addComponent(component)
                    expect(component.isAwake).to(beTrue())
                }
            }
        }
    }
}
