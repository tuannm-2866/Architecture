//
//  EditProductsAssembler.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import UIKit
import Reusable

protocol EditProductsAssembler {
    func resolve(navigationController: UINavigationController) -> EditProductsViewController
    func resolve(navigationController: UINavigationController) -> EditProductsViewModel
    func resolve(navigationController: UINavigationController) -> EditProductsNavigatorType
    func resolve() -> EditProductsUseCaseType
}

extension EditProductsAssembler {
    func resolve(navigationController: UINavigationController) -> EditProductsViewController {
        let vc = EditProductsViewController.instantiate()
        let vm: EditProductsViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> EditProductsViewModel {
        return EditProductsViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension EditProductsAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> EditProductsNavigatorType {
        return EditProductsNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> EditProductsUseCaseType {
        return EditProductsUseCase()
    }
}
