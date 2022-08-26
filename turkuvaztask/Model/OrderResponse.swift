//
//  OrderResponse.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 26.08.2022.
//

import Foundation

// MARK: - Welcome
struct OrderResponse: Codable {
    let meta: Meta
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let status: Bool
    let message: String
}

