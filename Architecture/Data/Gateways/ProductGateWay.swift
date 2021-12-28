//
//  ProductGateWay.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import Foundation
import RxSwift

protocol ProductGatewayType {
    func getProductList() -> Observable<[Product]>
}

struct ProductGateway: ProductGatewayType {
    let productRepository = ProductRepository()
    
    func getProductList() -> Observable<[Product]> {
        return productRepository.getProductList()
    }
}

