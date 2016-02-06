//
//  ResponseEntitySpec.swift
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


class ResponseEntitySpec: QuickSpec {
    override func spec() {
        let json: [String: AnyObject] = [
            "totalHits": 123,
            "hits": [imageJSON, imageJSON]
        ]
        
        it("parses JSON data to create a new instance.") {
            let response: ResponseEntity? = try? decode(json)
            
            expect(response).notTo(beNil())
            expect(response?.totalCount) == 123
            expect(response?.images.count) == 2
        }
    }
}
