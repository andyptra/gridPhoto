//
//  AlbumModel.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let meta: Meta
    let result: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case meta = "_meta"
        case result
    }
}

// MARK: - Meta
struct Meta: Codable {
    let success: Bool
    let code: Int
    let message: String
    let totalCount, pageCount, currentPage, perPage: Int
    let rateLimit: RateLimit
}

// MARK: - RateLimit
struct RateLimit: Codable {
    let limit, remaining, reset: Int
}

// MARK: - Result
struct Result: Codable {
    let id, userID, title: String
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, edit: Edit
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case edit
    }
}

// MARK: - Edit
struct Edit: Codable {
    let href: String
}



