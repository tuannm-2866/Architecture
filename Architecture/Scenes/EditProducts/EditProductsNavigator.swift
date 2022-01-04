//
//  EditProductsNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import UIKit

protocol EditProductsNavigatorType {
    func dismiss()
}

struct EditProductsNavigator: EditProductsNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
