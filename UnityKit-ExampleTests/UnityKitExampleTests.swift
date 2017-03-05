//
//  UnityKit_ExampleTests.swift
//  UnityKit-ExampleTests
//
//  Created by Jak Tiano on 2/19/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

import Quick
import Nimble
import SpriteKit
import UnityKit
@testable import UnityKit_Example

class GameEntityTests: QuickSpec {

    override func spec () {
        
        var gameViewController: GameViewController!
        var scene: TestGameScene!
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

			describe("its PhysicsEventComponent") {

				let category1	 =  UInt32(0x1 << 1)
				let category2	 =  UInt32(0x1 << 2)
				let categoryNone =  UInt32(0x1 << 0)

				it("recieves physics events") {

					// create physics body
					let bodySize = CGSize(width: 100, height: 100)
					let physicsBody = SKPhysicsBody(rectangleOf: bodySize)
					physicsBody.affectedByGravity = false

					// create components
					let testComponent = TestComponent()
					let physicsComponent = PhysicsComponent(withBody: physicsBody, category: category1, contactCategories: category2, collisionCategories: categoryNone)

					// add components
					entity.addComponent(testComponent)
					entity.addComponent(physicsComponent)

					// set up falling object
					let fallBody = SKPhysicsBody(rectangleOf: bodySize)
					let fallEntity = GameEntity(name: "Fall Object")
					fallEntity.addComponent(PhysicsComponent(withBody: fallBody, category: category2, contactCategories: categoryNone, collisionCategories: categoryNone))

					// set positions
					entity.node.position = CGPoint(x: 0, y: 0)
					fallEntity.node.position = CGPoint(x: 0, y: 110)

					// add both entities to scene
					scene.addEntity(entity)
					scene.addEntity(fallEntity)

					// expectations
					expect(testComponent.hasEnteredCollision).toEventually(beTrue(), timeout: 2.0)
					expect(testComponent.hasExitedCollision).toEventually(beTrue(), timeout: 2.0)
				}
			}
        }
    }
}
