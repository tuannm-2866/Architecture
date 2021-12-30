//
//  ProductDetailNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit

protocol ProductDetailNavigatorType {
    
}

struct ProductDetailNavigator: ProductDetailNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
