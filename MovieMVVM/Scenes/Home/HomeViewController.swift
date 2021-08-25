//
//  HomeViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.home
}
