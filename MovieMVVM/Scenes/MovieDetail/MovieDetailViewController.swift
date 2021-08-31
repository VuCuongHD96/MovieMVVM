//
//  MovieDetailViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class MovieDetailViewController: UIViewController {

    // MARK: - Property
    var viewModel: MovieDetailViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        
    }
}

extension MovieDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.movieDetail
}
