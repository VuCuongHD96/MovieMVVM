//
//  FavoriteViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class FavoriteViewController: UIViewController {

    // MARK: - Property
    var viewModel: FavoriteViewModel! {
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

extension FavoriteViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.favorite
}
