//
//  ImageSearching.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import ReactiveCocoa

public protocol ImageSearching {
    func searchImages() -> SignalProducer<ResponseEntity, NetworkError>
}
