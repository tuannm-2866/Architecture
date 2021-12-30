//
//  ProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol ProductsNavigatorType {
    func toProductDetail(product: Product)
}

struct ProductsNavigator: ProductsNavigatorType {

    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProductDetail(product: Product) {
        let vc: ProductDetailViewController = assembler.resolve(navigationController: navigationController, product: product)
        navigationController.pushViewController(vc, animated: true)
    }
}
