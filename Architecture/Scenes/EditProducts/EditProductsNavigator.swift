//
//  EditProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import UIKit

protocol EditProductsNavigatorType {
    
}

struct EditProductsNavigator: EditProductsNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
