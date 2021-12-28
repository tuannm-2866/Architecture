//
//  MainViewController.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

import UIKit
import Reusable
import SDWebImage
import RxSwift
import RxCocoa
import MGArchitecture

final class MainViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties

    @IBOutlet weak var toProductListButton: UIButton!
    var viewModel: MainViewModel!
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
        title = "Main"
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(
            load: Driver.just(()),
            toProductListTrigger: toProductListButton.rx.tap.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
