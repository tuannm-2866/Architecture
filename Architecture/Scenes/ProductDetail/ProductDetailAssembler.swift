//
//  ProductDetailAssembler.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit
import Reusable

protocol ProductDetailAssembler {
    func resolve(navigationController: UINavigationController, product: Product) -> ProductDetailViewController
    func resolve(navigationController: UINavigationController, product: Product) -> ProductDetailViewModel
    func resolve(navigationController: UINavigationController) -> ProductDetailNavigatorType
    func resolve() -> ProductDetailUseCaseType
}

extension ProductDetailAssembler {
    func resolve(navigationController: UINavigationController, product: Product) -> ProductDetailViewController {
        let vc = ProductDetailViewController.instantiate()
        let vm: ProductDetailViewModel = resolve(navigationController: navigationController, product: product)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController, product: Product) -> ProductDetailViewModel {
        return ProductDetailViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve(),
            product: product
        )
    }
}

extension ProductDetailAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ProductDetailNavigatorType {
        return ProductDetailNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> ProductDetailUseCaseType {
        return ProductDetailUseCase()
    }
}
