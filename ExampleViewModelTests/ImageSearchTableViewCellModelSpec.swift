//
//  ImageSearchTableViewCellModelSpec.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 08/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Quick
import Nimble
@testable import ExampleModel
@testable import ExampleViewModel

class ImageSearchTableViewCellModelSpec: QuickSpec {
    override func spec() {
        it("sets id.") {
            let viewModel = ImageSearchTableViewCellModel(image: dummyResponse.images[0])
            expect(viewModel.id).toEventually(equal(10000))
        }
        
        it("formats tags and page image size texts.") {
            let viewModel = ImageSearchTableViewCellModel(image: dummyResponse.images[0])
            expect(viewModel.pageImageSizeText).toEventually(equal("1000 x 2000"))
            expect(viewModel.tagText).toEventually(equal("a, b"))
        }
    }
}