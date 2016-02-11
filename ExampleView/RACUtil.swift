//
//  RACUtil.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 11/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import ReactiveCocoa

internal extension UITableViewCell {
    internal var racutil_prepareForReuseProducer: SignalProducer<(), NoError> {
        return self.rac_prepareForReuseSignal
        .toSignalProducer()
        .map { _ in }
            .flatMapError { _ in SignalProducer(value: ()) }
    }
}