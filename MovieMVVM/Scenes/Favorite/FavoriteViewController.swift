//
//  FavoriteViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class FavoriteViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FavoriteViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.favorite
}
