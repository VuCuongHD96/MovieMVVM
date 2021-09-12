//
//  HomeViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var nowCollection: UICollectionView!
    @IBOutlet private weak var topCollection: UICollectionView!
    
    // MARK: - Property
    var viewModel: HomeViewModel! {
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
        nowCollection.dataSource = viewModel.nowMovieDataSourceDelegate
        nowCollection.delegate = viewModel.nowMovieDataSourceDelegate
        nowCollection.reloadData()
        topCollection.dataSource = viewModel.topMovieDataSourceDelegate
        topCollection.delegate = viewModel.topMovieDataSourceDelegate
        topCollection.reloadData()
    }
    
    // MARK: - Action
    @IBAction func searchAction(_ sender: Any) {
        viewModel.searchDidTap = Void()
    }
}

extension HomeViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        nowCollection.do {
            $0.register(cellType: NowCell.self)
            $0.showsHorizontalScrollIndicator = false
        }
        topCollection.do {
            $0.register(cellType: TopCell.self)
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.home
}
