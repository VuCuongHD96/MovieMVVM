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
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var noMovieFoundView: UIView!
    
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
        collectionView.do {
            $0.dataSource = viewModel.searchDataSourceDelegate
            $0.delegate = viewModel.searchDataSourceDelegate
            $0.reloadData()
        }
        noMovieFoundView.isHidden = viewModel.isFoundMovie
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
    
    @IBAction func clearAction(_ sender: Any) {
        searchTextField.text = ""
        viewModel.searchText = ""
    }
}

extension SearchViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        searchTextField.placeholder = "Search your movie..."
        collectionView.do {
            $0.register(cellType: TopCell.self)
        }
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.search
}
