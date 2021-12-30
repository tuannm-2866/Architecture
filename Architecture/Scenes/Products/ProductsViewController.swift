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
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ProductsViewModel!
    var disposeBag = DisposeBag()
    var products = [Product]()

    
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
        let input = ProductsViewModel.Input(loadTrigger: Driver.just(()),
                                            selectProductTrigger: tableView.rx.itemSelected.asDriver()
                                            
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.products
            .drive(onNext: { [weak self] products in
                self?.products = products
                self?.tableView.reloadData()
            })
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
        return cell
    }

}

// MARK: - StoryboardSceneBased
extension ProductsViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.product
}


