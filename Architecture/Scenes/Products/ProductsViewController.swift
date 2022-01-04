//
//  ProductsViewController.swift
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

final class ProductsViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createProductButton: UIBarButtonItem!
    
    // MARK: - Properties
    
    var viewModel: ProductsViewModel!
    var disposeBag = DisposeBag()
    var products = [Product]()
    let deleteProductSubject = PublishSubject<IndexPath>()
    let editProductSubject = PublishSubject<IndexPath>()


    
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: ProductsCell.self)
    }
    
    func bindViewModel() {
        let createdProductTrigger = NotificationCenter.default.rx.notification(.createdProduct)
            .map { $0.object as? Product }
            .unwrap()
            .asDriverOnErrorJustComplete()
        
        let editedProductTrigger = NotificationCenter.default.rx.notification(.editProduct)
            .map { $0.object as? Product }
            .unwrap()
            .asDriverOnErrorJustComplete()
        
        let input = ProductsViewModel.Input(
            loadTrigger: .just(()),
            selectProductTrigger: tableView.rx.itemSelected.asDriver(),
            deleteProductTrigger: deleteProductSubject.asDriverOnErrorJustComplete(),
            editProductTrigger: editProductSubject.asDriverOnErrorJustComplete(),
            editedProductTrigger: editedProductTrigger,
            createProductTrigger: createProductButton.rx.tap.asDriver(),
            createdProductTrigger: createdProductTrigger
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.products
            .drive(onNext: { [weak self] products in
                self?.products = products
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output.isLoading
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductsCell.self)
        cell.nameLabel.text = products[indexPath.row].name
        cell.priceLabel.text = "\(products[indexPath.row].price)"
        cell.editProduct = {[weak self] in
            self?.editProductSubject.onNext(indexPath)
        }
        
        cell.deleteProduct = {[weak self] in
            self?.deleteProductSubject.onNext(indexPath)
        }
        
        return cell
    }

}

// MARK: - StoryboardSceneBased
extension ProductsViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.product
}


