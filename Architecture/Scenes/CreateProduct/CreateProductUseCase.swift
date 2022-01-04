//
//  CreateProductUseCase.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 02/01/2022.
//

import RxSwift

protocol CreateProductUseCaseType {
    func createProduct(_ product: Product) -> Observable<Product>
    func notifyCreateProduct(_ product: Product)
}

struct CreateProductUseCase: CreateProductUseCaseType, CreateProduct {
    var productGateway: ProductGatewayType

    func notifyCreateProduct(_ product: Product) {
        NotificationCenter.default.post(name: .createdProduct, object: product)
    }
}
