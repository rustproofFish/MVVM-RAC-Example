//
//  RACUtil.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 08/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import ReactiveCocoa

internal extension NSObject {
    internal var racutil_wilDeallocProducer: SignalProducer<(), NoError> {
        return self.rac_willDeallocSignal()
        .toSignalProducer()
            .map { _ in }
            .flatMapError { _ in SignalProducer(value: ()) }
    }
}