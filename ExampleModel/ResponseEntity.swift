//
//  ResponseEntity.swift
//  SwinjectMVVMExample
//
//  Created by Adrian Ward on 05/02/2016.
//  Copyright © 2016 Adrian Ward. All rights reserved.
//

import Foundation
import Himotoki

public struct ResponseEntity {
    public let totalCount: Int64
    public let images: [ImageEntity]
}


// MARK: Decodeable
extension ResponseEntity: Decodable {
    public static func decode(e: Extractor) throws -> ResponseEntity {
        return try ResponseEntity(
            totalCount: e <| "totalHits",
            images: e <|| "hits"
        )
    }
}