//
//  EditProductsAssembler.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import UIKit
import Reusable

protocol EditProductsAssembler {
    func resolve(navigationController: UINavigationController, product: Product) -> EditProductsViewController
    func resolve(navigationController: UINavigationController, product: Product) -> EditProductsViewModel
    func resolve(navigationController: UINavigationController) -> EditProductsNavigatorType
    func resolve() -> EditProductsUseCaseType
}

extension EditProductsAssembler {
    func resolve(navigationController: UINavigationController, product: Product) -> EditProductsViewController {
        let vc = EditProductsViewController.instantiate()
        let vm: EditProductsViewModel = resolve(navigationController: navigationController, product: product)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController, product: Product) -> EditProductsViewModel {
        return EditProductsViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve(),
            product: product
        )
    }
}

extension EditProductsAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> EditProductsNavigatorType {
        return EditProductsNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> EditProductsUseCaseType {
        return EditProductsUseCase(productGateway: resolve())
    }
}
