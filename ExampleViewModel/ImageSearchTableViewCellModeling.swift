//
//  ImageSearchTableViewCellModeling.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import ReactiveCocoa

public protocol ImageSearchTableViewCellModeling {
    var id: UInt64 { get }
    var pageImageSizeText: String { get }
    var tagText: String { get }
    
    func getPreviewImage() -> SignalProducer<UIImage?, NoError>
}