//
//  HomeViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController {

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
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.home
}
