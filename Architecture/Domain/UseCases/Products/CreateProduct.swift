//
//  CreateProduct.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 02/01/2022.
//

import Foundation
import RxSwift

protocol CreateProduct {
    var productGateway: ProductGatewayType {get}
}

extension CreateProduct {
    func createProduct(_ product: Product) -> Observable<Product> {
        return productGateway.createProduct(product)
    }
}

struct CreateProductError: Error, LocalizedError {
    let message: String
    
    var errorDescription: String? {
        return message
    }
}
