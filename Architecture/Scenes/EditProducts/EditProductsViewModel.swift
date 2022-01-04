//
//  EditProductsViewModel.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct EditProductsViewModel {
    let navigator: EditProductsNavigatorType
    let useCase: EditProductsUseCaseType
    let product: Product
}

// MARK: - ViewModel
extension EditProductsViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let productName: Driver<String>
        let productPrice: Driver<String>
        let editProductTrigger: Driver<Void>
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
        
        let id = input.loadTrigger
            .map {self.product.id}
        
        let newName = input.productName

        let newPrice = input.productPrice
            .map {Double($0)}
            .unwrap()

        input.editProductTrigger
            .withLatestFrom(Driver.combineLatest(id, newName, newPrice))
            .flatMapLatest { (id, newName, newPrice) -> Driver<Product> in
                let newProduct = Product(id: id, name: newName, price: newPrice)
                return self.useCase.editProduct(newProduct)
                    .asDriverOnErrorJustComplete()
            }
            .drive(onNext: { product in
                self.useCase.notifyEditProduct(product)
                self.navigator.dismiss()
            })
            .disposed(by: disposeBag)
            
        return Output(name: name, price: price)
    }
}
