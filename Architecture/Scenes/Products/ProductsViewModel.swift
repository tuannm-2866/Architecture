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
        let editedProductTrigger: Driver<Product>
        let createProductTrigger: Driver<Void>
        let createdProductTrigger: Driver<Product>

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
        
        Driver.merge(
            input.loadTrigger,
            input.createdProductTrigger.mapToVoid(),
            input.editedProductTrigger.mapToVoid()
        )
            .flatMapLatest {
                return self.useCase.getProductList()
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
                let product = products[indexPath.row]
                let updateProducts = products.filter {$0.id != product.id}
                productSubject.onNext(updateProducts)
            })
            .disposed(by: disposeBag)
        
        input.editProductTrigger
            .withLatestFrom(products) { indexPath, products in
                return (indexPath, products)
            }
            .drive(onNext: { indexPath, products in
                let product = products[indexPath.row]
                self.navigator.toEditProduct(product: product)
            })
            .disposed(by: disposeBag)
        
        input.createProductTrigger
            .drive(onNext: {
                    self.navigator.toCreateProduct()
            })
            .disposed(by: disposeBag)
        
        return Output(
            products: products,
            isLoading: isLoading
        )
    }
}
