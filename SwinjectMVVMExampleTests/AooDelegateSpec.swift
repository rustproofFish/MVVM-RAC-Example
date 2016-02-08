//
//  AooDelegateSpec.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Quick
import Nimble
import Swinject
import ExampleModel
import ExampleViewModel
import ExampleView
@testable import SwinjectMVVMExample

class AppDelegateSpec: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = AppDelegate().container
        }
        
        describe("Container") {
            it("resolves every service type.") {
                // Models
                expect(container.resolve(Networking.self)).notTo(beNil())
                expect(container.resolve(ImageSearching.self)).notTo(beNil())
                
                // View models
                expect(container.resolve(ImageSearchTableViewModeling.self)).notTo(beNil())
            }
            
            it("injects view models to views.") {
                let bundle = NSBundle(forClass: ImageSearchTableViewController.self)
                let storyboard = SwinjectStoryboard.create(
                    name: "Main",
                    bundle: bundle,
                    container: container)
                let imageSearchTableViewController = storyboard
                .instantiateViewControllerWithIdentifier("ImageSearchTableViewController") as! ImageSearchTableViewController
                
                expect(imageSearchTableViewController.viewModel).notTo(beNil())
                }
            
            }
        }
}
