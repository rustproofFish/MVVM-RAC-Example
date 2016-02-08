//
//  NetworkSpec.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 05/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ExampleModel

class NetworkSpec: QuickSpec {
    override func spec() {
        var network: Network!
        
        beforeEach {
            network = Network()
        }
        
        describe("JSON") {
            it("eventually gets JSON data as specified by the parameters.") {
                var json: [String: AnyObject]? = nil
                let url = "https://httpbin.org/get"
                network.requestJSON(url, parameters: ["a": "b", "x": "y"])
                    .on(next: { json = $0 as? [String: AnyObject] })
                    .start()
                
                expect(json).toEventuallyNot(beNil(), timeout: 5)
                expect((json?["args"] as? [String: AnyObject])?["a"] as? String).toEventually(equal("b"), timeout: 5)
                expect((json?["args"] as? [String: AnyObject])?["x"] as? String).toEventually(equal("y"), timeout: 5)
            }
            
            it("eventually gets an error if the network has a problem.") {
                var error: NetworkError? = nil
                let url = "https://not.existing.server.com/get"
                network.requestJSON(url, parameters: ["a": "b", "x": "y"])
                    .on(failed: { error = $0 })
                    .start()
                
                expect(error).toEventually(equal(NetworkError.NotReachedServer), timeout: 5)
            }
        }
        
        describe("image") {
            it("eventually gets an image.") {
                var image: UIImage?
                network.requestImage("https://httpbin.org/image/jpeg")
                    .on(next: { image = $0 })
                    .start()
                
                expect(image).toEventuallyNot(beNil(), timeout: 5)
            }
            
            it("eventually gets and error if incorrect data for an image is returned.") {
                var error: NetworkError?
                network.requestImage("https://httpbin.org/get/")
                    .on(failed: { error = $0 })
                    .start()
                
                expect(error).toEventually(equal(NetworkError.IncorrectDataReturned), timeout: 5)
            }
            
            it("eventually gets an error if the network has a problem.") {
                var error: NetworkError? = nil
                network.requestImage("https://not.existing.server.comn/image/jpeg")
                    .on(failed: { error = $0 })
                    .start()
                
                expect(error).toEventually(equal(NetworkError.NotReachedServer), timeout: 5)
            }
        }
    }
}
