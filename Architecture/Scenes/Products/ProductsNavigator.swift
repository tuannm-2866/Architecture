//
//  ProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol ProductsNavigatorType {
    func toProductDetail(product: Product)
    func toEditProduct(product: Product)
    func toCreateProduct()
}

struct ProductsNavigator: ProductsNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProductDetail(product: Product) {
        let vc: ProductDetailViewController = assembler.resolve(navigationController: navigationController, product: product)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toEditProduct(product: Product) {
        let nav = UINavigationController()
        let vc: EditProductsViewController = assembler.resolve(navigationController: nav, product: product)
        nav.viewControllers = [vc]
        nav.modalPresentationStyle = .fullScreen
        navigationController.present(nav, animated: true, completion: nil)
    }
    
    func toCreateProduct() {
        let nav = UINavigationController()
        let vc: CreateProductViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers = [vc]
        nav.modalPresentationStyle = .fullScreen
        navigationController.present(nav, animated: true, completion: nil)
    }
}

