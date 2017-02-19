//
//  UnityKitTests.swift
//  UnityKitTests
//
//  Created by Jak Tiano on 2/18/17.
//  Copyright © 2017 Jak Tiano. All rights reserved.
//

import Quick
import Nimble
import UnityKit

class UnityKitTests: QuickSpec {

    override func spec () {

        describe("true") {
            it("is true") {
                expect(true).to(beTruthy())
            }
        }
    }
}
