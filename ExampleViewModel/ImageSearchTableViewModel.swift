//
//  ImageSearchTableViewModel.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import ExampleModel

public final class ImageSearchTableViewModel: ImageSearchTableViewModeling {
    private let imageSearch: ImageSearching
    
    public init(imageSearch: ImageSearching) {
        self.imageSearch = imageSearch
    }
}