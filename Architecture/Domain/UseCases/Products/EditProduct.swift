//
//  EditProduct.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 03/01/2022.
//

import Foundation
import RxSwift

protocol EditProduct {
    var productGateway: ProductGatewayType {get}
}

extension EditProduct {
    func editProduct(_ product: Product) -> Observable<Product> {
        return productGateway.editProduct(product)
    }
}
