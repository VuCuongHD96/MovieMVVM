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
    }
    
    // MARK: - Data
    private func setupData() {
        viewModel.showData()
    }

    // MARK: - Bind Data
    private func bindViewModel() {
        tableView.dataSource = viewModel.genreDataSourceDelegate
    }
}

extension GenreViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.genre
}
