//
//  CreateProductViewController.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 02/01/2022.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class CreateProductViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveProductButton: UIBarButtonItem!
    // MARK: - Properties
    
    var viewModel: CreateProductViewModel!
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
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func configView() {
        
    }
    
    func bindViewModel() {
        let input = CreateProductViewModel.Input(
            productName: nameTextField.rx.value.orEmpty.asDriver(),
            productPrice: priceTextField.rx.value.orEmpty.asDriver(),
            createProductTrigger: saveProductButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.error
            .drive(rx.error)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension CreateProductViewController {
    
}

// MARK: - StoryboardSceneBased
extension CreateProductViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.createProduct
}
