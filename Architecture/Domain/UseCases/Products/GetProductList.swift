//
//  GetProductList.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit
import RxSwift

protocol GetProductList {
    var productGateway: ProductGatewayType {get}
}

extension GetProductList {
    func getProductList() -> Observable<[Product]> {
        return productGateway.getProductList()
    }
}
