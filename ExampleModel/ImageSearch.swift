//
//  ImageSearch.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result
import Himotoki


public final class ImageSearch: ImageSearching {
    private let network: Networking
    
    public init(network: Networking) {
        self.network = network
    }
    
    public func searchImages() -> SignalProducer<ResponseEntity, NetworkError> {
        let url = Pixabay.apiURL
        let parameters = Pixabay.requestParameters
        return network.requestJSON(url, parameters: parameters)
            .attemptMap { json in
                if let response = (try? decode(json)) as ResponseEntity? {
                    return Result(value: response)
                }
                else {
                    return Result(error: .IncorrectDataReturned)
                }
        }
    }
}