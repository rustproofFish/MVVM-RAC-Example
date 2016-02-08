//
//  ImageSearchTableViewControllerSpec.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 08/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Quick
import Nimble
import ReactiveCocoa
import ExampleViewModel
@testable import ExampleView

class ImageSearchTableViewControllerSpec: QuickSpec {
    // MARK: Mock
    class MockViewModel: ImageSearchTableViewModeling {
        let cellModels = AnyProperty(MutableProperty<[ImageSearchTableViewCellModeling]>([]))
        var startSearchCellCount = 0
        
        func startSearch() {
            startSearchCellCount++
        }
    }
    
    // MARK: Spec
    override func spec() {
        it("starts searching images when the view is about to appear for the first time.") {
            let viewModel = MockViewModel()
            let storyboard = UIStoryboard(
                name: "Main",
                bundle: NSBundle(forClass: ImageSearchTableViewController.self))
            let viewController = storyboard.instantiateViewControllerWithIdentifier("ImageSearchTableViewController") as! ImageSearchTableViewController
            viewController.viewModel = viewModel
            
            expect(viewModel.startSearchCellCount) == 0
            viewController.viewWillAppear(true)
            expect(viewModel.startSearchCellCount) == 1
            viewController.viewWillAppear(true)
            expect(viewModel.startSearchCellCount) == 1
        }
    }
}
