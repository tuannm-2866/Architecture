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

final class EditProductsViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
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
    
    private func configView() {
        priceTextField.placeholder = "Price"
        nameTextField.placeholder = "Name"
        
    }
    
    func bindViewModel() {
        let input = EditProductsViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension EditProductsViewController {
    
}

// MARK: - StoryboardSceneBased
extension EditProductsViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.editProduct
}
