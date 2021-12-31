//
//  ProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol ProductsNavigatorType {
    func toProductDetail(product: Product)
    func toEditproduct()
}

struct ProductsNavigator: ProductsNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProductDetail(product: Product) {
        let vc: ProductDetailViewController = assembler.resolve(navigationController: navigationController, product: product)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toEditproduct() {
        let vc: EditProductsViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
  
}

