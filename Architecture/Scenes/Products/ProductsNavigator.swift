//
//  ProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol ProductsNavigatorType {

}

struct ProductsNavigator: ProductsNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
