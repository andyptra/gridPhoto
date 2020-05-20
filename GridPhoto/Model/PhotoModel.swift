//
//  PhotoModel.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let meta: MetaPhoto
    let result: [ResultPhoto]?
    
    enum CodingKeys: String, CodingKey {
        case meta = "_meta"
        case result
    }
}

// MARK: - Meta
struct MetaPhoto: Codable {
    let success: Bool
    let code: Int
    let message: String
    let totalCount, pageCount, currentPage, perPage: Int
    let rateLimit: RateLimitPhoto
}

// MARK: - RateLimit
struct RateLimitPhoto: Codable {
    let limit, remaining, reset: Int
}

// MARK: - Result
struct ResultPhoto: Codable {
    let id, albumID, title: String
    let url, thumbnail: String
    let links: LinksPhoto
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case title, url, thumbnail
        case links = "_links"
    }
}

// MARK: - Links
struct LinksPhoto: Codable {
    let linksSelf, edit: EditPhoto
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case edit
    }
}

// MARK: - Edit
struct EditPhoto: Codable {
    let href: String
}
