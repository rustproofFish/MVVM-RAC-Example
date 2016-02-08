//
//  Networking.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 05/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import ReactiveCocoa

public protocol Networking {
    
    func requestJSON(url: String, parameters: [String: AnyObject]?) ->
        SignalProducer<AnyObject, NetworkError>
    
    func requestImage(url: String) -> SignalProducer<UIImage, NetworkError>
    
}