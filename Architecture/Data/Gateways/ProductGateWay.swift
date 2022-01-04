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
    func createProduct(_ product: Product) -> Observable<Product>
    func editProduct(_ product: Product) -> Observable<Product>
}

struct ProductGateway: ProductGatewayType {
    let productRepository = ProductRepository()
    
    func getProductList() -> Observable<[Product]> {
        return productRepository.getProductList()
    }
    
    func createProduct(_ product: Product) -> Observable<Product> {
        return productRepository.createProduct(product)
    }
    
    func editProduct(_ product: Product) -> Observable<Product> {
        return productRepository.editProduct(product)
    }
}


