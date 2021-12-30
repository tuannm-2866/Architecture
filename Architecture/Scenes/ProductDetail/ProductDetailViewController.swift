//
//  ProductDetailViewController.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class ProductDetailViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    var viewModel: ProductDetailViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        title = "Product Detail"
    }
    
    func bindViewModel() {
        let input = ProductDetailViewModel.Input(loadTrigger: .just(()))
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.name
            .drive(onNext: { [weak self] name in
                self?.productNameLabel.text = name
            })
            .disposed(by: disposeBag)
        output.price
            .drive(onNext: { [weak self] price in
                self?.productPriceLabel.text = "\(price)"
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension ProductDetailViewController {
    
}

// MARK: - StoryboardSceneBased
extension ProductDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.productDetail
}
