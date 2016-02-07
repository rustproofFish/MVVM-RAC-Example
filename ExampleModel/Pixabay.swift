//
//  Pixabay.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 07/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

internal struct Pixabay {
    internal static let apiURL = "https://pixabay.com/api/"
    
    internal static var requestParameters: [String: AnyObject] {
        return [
            "key": Config.apiKey,
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50
        ]
    }
}

extension Pixabay {
    private struct Config {
        private static let apiKey = "2019266-2db8a99f62aba116b11ce73cd"
    }
}