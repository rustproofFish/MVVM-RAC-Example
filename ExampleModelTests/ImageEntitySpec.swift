//
//  ImageEntitySpec.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 05/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki
@testable import ExampleModel


class ImageEntitySpec: QuickSpec {
    override func spec() {
        it("parses JSON data to create a new instance.") {
            let image: ImageEntity? = try? decode(imageJSON)
            
            expect(image).notTo(beNil())
            expect(image?.id) == 12345
            expect(image?.pageURL) == "https://somewhere.com/page/"
            expect(image?.pageImageWidth) == 2000
            expect(image?.pageImageHeight) == 1000
            expect(image?.previewURL) == "https://somewhere.com/preview.jpg"
            expect(image?.previewWidth) == 200
            expect(image?.previewHeight) == 100
            expect(image?.imageURL) == "https://somewhere.com/image.jpg"
            expect(image?.imageWidth) == 600
            expect(image?.imageHeight) == 300
            expect(image?.viewCount) == 54321
            expect(image?.downloadCount) == 4321
            expect(image?.likeCount) == 321
            expect(image?.tags) == ["a", "b c", "d"]
            expect(image?.username) == "Swinject"
        }
        
        it("gets an emoty arrat uf tags element is nil.") {
            var missingJSON = imageJSON
            missingJSON["tags"] = nil
            let image: ImageEntity? = try? decode(missingJSON)
            
            expect(image).notTo(beNil())
            expect(image?.tags.isEmpty).to(beTrue())
        }
        
        it("throws an error if any of the JSON elements except tags is missing.") {
            for key in imageJSON.keys where key != "tags" {
                var missingJSON = imageJSON
                missingJSON[key] = nil
                let image: ImageEntity? = try? decode(missingJSON)
                
                expect(image).to(beNil())
            }
        }
        
        it("ignores an extra JSON element") {
            var extraJSON = imageJSON
            extraJSON["extraKey"] = "extra element"
            let image: ImageEntity? = try? decode(extraJSON)
            
            expect(image).notTo(beNil())
        }
    }
}

