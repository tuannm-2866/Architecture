//
//  APIOutput.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import ObjectMapper
import MGAPIService

class APIOutput: APIOutputBase {  // swiftlint:disable:this final_class
    var message: String?
    
    override func mapping(map: Map) {
        message <- map["message"]
    }
}
