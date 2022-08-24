//
//  Product.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import Foundation

struct Product: Codable {
    let meta: Meta
    let data: [Item]
}

// MARK: - Datum
struct Item: Codable {
    let id, name: String
    let price: Double
    let currency: String
    let imageURL: String
    let stock: Int

    enum CodingKeys: String, CodingKey {
        case id, name, price, currency
        case imageURL = "imageUrl"
        case stock
    }
}

// MARK: - Meta
struct Meta: Codable {
    let statusCode: Int
    let metaDescription: String

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case metaDescription = "description"
    }
}
