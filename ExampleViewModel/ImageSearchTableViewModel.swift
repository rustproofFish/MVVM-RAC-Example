//
//  ImageSearchTableViewModel.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import ReactiveCocoa
import ExampleModel

public final class ImageSearchTableViewModel: ImageSearchTableViewModeling {
    public var cellModels: AnyProperty<[ImageSearchTableViewCellModeling]> {
        return AnyProperty(_cellModels)
    }
    private let _cellModels = MutableProperty<[ImageSearchTableViewCellModeling]>([])
    private let imageSearch: ImageSearching
    
    public init(imageSearch: ImageSearching) {
        self.imageSearch = imageSearch
    }
    
    public func startSearch() {
        imageSearch.searchImages()
            .map { response in
                response.images.map {
                    ImageSearchTableViewCellModel(image: $0) as ImageSearchTableViewCellModeling
                }
        }
        .observeOn(UIScheduler())
            .on(next: { cellModels in
                self._cellModels.value = cellModels
        })
        .start()
    }
}