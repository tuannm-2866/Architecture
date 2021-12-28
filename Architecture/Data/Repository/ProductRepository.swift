//
//  ProductReppsitory.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import Foundation
import RxSwift

struct ProductRepository {
    func getProductList() -> Observable<[Product]> {
        return .just([
            Product(id: 1, name: "iphone", price: 1000),
            Product(id: 2, name: "macbook", price: 3000)
        ])
    }
}
