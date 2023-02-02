//
//  MultipleModel.swift
//  DemoMultipleApiLink
//
//  Created by Guru Mahan on 01/01/23.
//

import Foundation

struct MultipleModel: Codable {
    let count: Int
    let entries: [EntriesInnerData]
}

// MARK: - Entry
struct EntriesInnerData: Codable {
    let api, entryDescription: String
    let auth: Auth
    let https: Bool
    let cors: Cors
    let link: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case entryDescription = "Description"
        case auth = "Auth"
        case https = "HTTPS"
        case cors = "Cors"
        case link = "Link"
        case category = "Category"
    }
}

enum Auth: String, Codable {
    case apiKey = "apiKey"
    case empty = ""
    case oAuth = "OAuth"
    case userAgent = "User-Agent"
    case xMashapeKey = "X-Mashape-Key"
}

enum Cors: String, Codable {
    case no = "no"
    case unknown = "unknown"
    case unkown = "unkown"
    case yes = "yes"
}
