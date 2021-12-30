//
//  ProductDetailViewModel.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import MGArchitecture
import RxSwift
import RxCocoa
import Foundation

struct ProductDetailViewModel {
    let navigator: ProductDetailNavigatorType
    let useCase: ProductDetailUseCaseType
    let product: Product
}

// MARK: - ViewModel
extension ProductDetailViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let name: Driver<String>
        let price: Driver<Double>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let name = input.loadTrigger
            .map {self.product.name}
        let price = input.loadTrigger
            .map {self.product.price}
        
        return Output(name: name, price: price)
    }
}
