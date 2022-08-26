//
//  Request.swift
//  turkuvaztask
//
//  Created by Tahir Uzelli on 26.08.2022.
//

import Foundation
import Alamofire

func afRequest(url: URL) async throws -> Data {
    try await withUnsafeThrowingContinuation { continuation in
        AF.request(url, method: .get).validate().responseData { response in
            if let data = response.data {
                continuation.resume(returning: data)
                return
            }
            if let err = response.error {
                continuation.resume(throwing: err)
                return
            }
            fatalError("Error while doing Alamofire url request")
        }
    }
}
