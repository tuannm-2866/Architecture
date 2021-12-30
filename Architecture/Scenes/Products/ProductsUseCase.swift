//
//  ProductsUseCase.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import RxSwift

protocol ProductsUseCaseType {
    func getProductList() -> Observable<[Product]>
}

struct ProductsUseCase: ProductsUseCaseType, GetProductList {
    var productGateway: ProductGatewayType
}
