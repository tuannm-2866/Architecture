//
//  EditProductsViewController.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 30/12/2021.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class EditProductsViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    // MARK: - Properties
    
    var viewModel: EditProductsViewModel!
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
    
    @IBAction func cancelProductAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func configView() {
        
    }
    
    func bindViewModel() {
        let input = EditProductsViewModel.Input(
            loadTrigger: .just(()),
            productName: nameTextField.rx.value.orEmpty.asDriver(),
            productPrice: priceTextField.rx.value.orEmpty.asDriver(),
            editProductTrigger: saveButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.name
            .drive(onNext: { [weak self] name in
                self?.nameTextField.text = name
            })
            .disposed(by: disposeBag)
        
        output.price
            .drive(onNext: { [weak self] price in
                self?.priceTextField.text = "\(price)"
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension EditProductsViewController {
    
}

// MARK: - StoryboardSceneBased
extension EditProductsViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.editProduct
}
