//
//  CreateProductNavigator.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 02/01/2022.
//

import UIKit

protocol CreateProductNavigatorType {
    func dismiss()
}

struct CreateProductNavigator: CreateProductNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
}
