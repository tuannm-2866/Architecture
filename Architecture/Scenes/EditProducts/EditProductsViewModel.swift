//
//  EditProductsViewModel.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct EditProductsViewModel {
    let navigator: EditProductsNavigatorType
    let useCase: EditProductsUseCaseType
}

// MARK: - ViewModel
extension EditProductsViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
