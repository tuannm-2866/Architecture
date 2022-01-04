//
//  EditProductsUseCase.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import RxSwift

protocol EditProductsUseCaseType {
    func editProduct(_ product: Product) -> Observable<Product>
    func notifyEditProduct(_ product: Product)
}

struct EditProductsUseCase: EditProductsUseCaseType, EditProduct {
    var productGateway: ProductGatewayType

    func notifyEditProduct(_ product: Product) {
        NotificationCenter.default.post(name: .editProduct, object: product)
    }
}
