//
//  GenreViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable
import Then

final class GenreViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    var viewModel: GenreViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupView()
    }
    
    // MARK: - Data
    private func setupData() {
        viewModel.showData()
    }
    
    private func setupView() {
        tableView.do {
            $0.separatorStyle = .none
            $0.register(cellType: GenreImageCell.self)
        }
    }

    // MARK: - Bind Data
    private func bindViewModel() {
        tableView.dataSource = viewModel.genreDataSourceDelegate
        tableView.delegate = viewModel.genreDataSourceDelegate
        tableView.reloadData()
    }
}

extension GenreViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.genre
}
