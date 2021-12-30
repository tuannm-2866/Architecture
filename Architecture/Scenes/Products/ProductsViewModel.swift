//
//  ProductsViewModel.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct ProductsViewModel {
    let navigator: ProductsNavigatorType
    let useCase: ProductsUseCaseType
}

// MARK: - ViewModel
extension ProductsViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectProductTrigger: Driver<IndexPath>
//        let deleteProductTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let products: Driver<[Product]>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let products = input.loadTrigger
            .flatMapLatest {
                self.useCase.getProductList()
                    .asDriverOnErrorJustComplete()
            }
        input.selectProductTrigger
            .withLatestFrom(products) { indexPath, products in
                return products[indexPath.row]
            }
            .drive(onNext: { product in
                self.navigator.toProductDetail(product: product)
                
            })
 
            .disposed(by: disposeBag)
        return Output(
            products: products
        )
    }
}
