//
//  ExampleModel.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 05/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import Himotoki

public struct ImageEntity {
    
    public let id: UInt64
    
    public let pageURL: String
    public let pageImageWidth: Int
    public let pageImageHeight: Int
    
    public let previewURL: String
    public let previewWidth: Int
    public let previewHeight: Int
    
    public let imageURL: String
    public let imageWidth: Int
    public let imageHeight: Int
    
    public let viewCount: Int64
    public let downloadCount: Int64
    public let likeCount: Int64
    public let tags: [String]
    public let user: String
}


// MARK: Decodable
extension ImageEntity: Decodable {
    public static func decode(e: Extractor) throws -> ImageEntity {
        let splitCSV: String -> [String] = { csv in
            csv.characters
                .split {$0 == ","}
                .map {
                    String($0).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            }
        }
        
        return try ImageEntity(
            id: e <| "id",
            pageURL: e <| "pageURL",
            pageImageWidth: e <| "imageWidth",
            pageImageHeight: e <| "imageHeight",
            
            previewURL: e <| "previewURL",
            previewWidth: e <| "previewWidth",
            previewHeight: e <| "previewHeight",
            
            imageURL: e <| "webformatURL",
            imageWidth: e <| "webformatWidth",
            imageHeight: e <| "webformatHeight",
            
            viewCount: e <| "views",
            downloadCount: e <| "downloads",
            likeCount: e <| "likes",
            tags: (try? e <| "tags").map(splitCSV) ?? [],
            user: e <| "user"
        )
    }
}