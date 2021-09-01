//
//  SearchViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class SearchViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var searchTextField: UITextField!
    
    // MARK: - Property
    var viewModel: SearchViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        viewModel.backDidTap = Void()
    }
    
    @IBAction func searchTextFieldDidChange(_ sender: Any) {
        guard let searchText = searchTextField.text else {
            return
        }
        viewModel.searchText = searchText
    }
}

extension SearchViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        searchTextField.placeholder = "Search your movie..."
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.search
}
