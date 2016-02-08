//
//  ImageSearchTableViewModeling.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import ReactiveCocoa

public protocol ImageSearchTableViewModeling {
    var cellModels: AnyProperty<[ImageSearchTableViewCellModeling]> { get }
    func startSearch()
}