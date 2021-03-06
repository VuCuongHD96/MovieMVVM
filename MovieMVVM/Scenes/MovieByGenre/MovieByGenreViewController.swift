//
//  MovieByGenreViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class MovieByGenreViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Property
    var viewModel: MovieByGenreViewModelType! {
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
        tableView.do {
            $0.dataSource = viewModel.movieByGenreDataSourceDelegate
            $0.delegate = viewModel.movieByGenreDataSourceDelegate
            $0.reloadData()
        }
        titleLabel.text = viewModel.genreName
    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: Any) {
        viewModel.backDidTap = Void()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        viewModel.searchDidTap = Void()
    }
}

extension MovieByGenreViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: MovieByGenreCell.self)
            $0.separatorStyle = .none
        }
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension MovieByGenreViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.movieByGenre
}
