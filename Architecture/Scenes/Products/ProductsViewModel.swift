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
        let deleteProductTrigger: Driver<IndexPath>
        let editProductTrigger: Driver<IndexPath>

    }
    
    struct Output {
        let products: Driver<[Product]>
        let isLoading: Driver<Bool>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let productSubject = PublishSubject<[Product]>()
        let products = productSubject.asDriverOnErrorJustComplete()
        
        let activityIndicator = ActivityIndicator()
        let isLoading = activityIndicator.asDriver()
        
        input.loadTrigger
            .flatMapLatest {
                self.useCase.getProductList()
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }
            .drive(onNext: { products in
                productSubject.onNext(products)
            })
            .disposed(by: disposeBag)
        
        input.selectProductTrigger
            .withLatestFrom(products) { indexPath, products in
                return products[indexPath.row]
            }
            .drive(onNext: { product in
                self.navigator.toProductDetail(product: product)
            })
            .disposed(by: disposeBag)
        
        input.deleteProductTrigger
            .withLatestFrom(products) { indexPath, products in
                return (indexPath, products)
            }
            .drive(onNext: { indexPath, products in
                let updateProducts = products.filter {$0.id != products[indexPath.row].id}
                productSubject.onNext(updateProducts)
            })
            .disposed(by: disposeBag)
        
        input.editProductTrigger
            .withLatestFrom(products) { indexPath, products in
                return (indexPath, products)
            }
            .drive(onNext: { indexPath, product in
                self.navigator.toEditproduct()
            })
            .disposed(by: disposeBag)
        
        return Output(
            products: products,
            isLoading: isLoading
        )
    }
}
