//
//  APIError.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import MGAPIService
import Foundation

struct APIResponseError: APIError {
    let statusCode: Int?
    let message: String
    
    var errorDescription: String? {
        return message
    }
}
