//
//  TabbarViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class TabbarViewController: UITabBarController {
    
    // MARK: - Property
    var viewModel: TabbarViewModel! {
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
    }
    
    // MARK: - View
    private func setupView() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = true
        let navigator = TabbarNavigator(navigationController: navigationController)
        viewModel = TabbarViewModel(navigator: navigator)
        viewModel.showData()
    }
 
    // MARK: - Bind Data
    private func bindViewModel() {
        self.viewControllers = viewModel.viewControllers
    }
}

extension TabbarViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.main
}
