//
//  GatewaysAssembler.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol GatewaysAssembler {
    func resolve() -> ProductGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {
    func resolve() -> ProductGatewayType {
        return ProductGateway()
    }
}
