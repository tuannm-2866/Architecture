//
//  MainViewModel.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

// MARK: - ViewModel
extension MainViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
        let toProductListTrigger: Driver<Void>
    }
    
    struct Output {

    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        
        input.toProductListTrigger
            .drive(onNext: {
                self.navigator.toProductList()
            })
        return output
    }
}
