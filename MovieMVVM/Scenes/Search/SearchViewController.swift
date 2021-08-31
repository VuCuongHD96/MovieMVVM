//
//  SearchViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class SearchViewController: UIViewController {

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

    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        
    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.search
}
