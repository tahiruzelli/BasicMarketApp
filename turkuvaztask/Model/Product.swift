//
//  Product.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 23.08.2022.
//

import Foundation

struct Product: Codable {
    let id, name: String
    let price: Int
    let currency: String
    let imageURL: String
    let stock: Int

    enum CodingKeys: String, CodingKey {
        case id, name, price, currency
        case imageURL = "imageUrl"
        case stock
    }
}
