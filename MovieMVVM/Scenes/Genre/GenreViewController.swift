//
//  GenreViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class GenreViewController: UIViewController {

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
    }

    // MARK: - Bind Data
    private func bindViewModel() {
        
    }
}

extension GenreViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.genre
}
