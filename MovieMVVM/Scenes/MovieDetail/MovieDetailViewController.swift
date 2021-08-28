//
//  MovieDetailViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class MovieDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.movieDetail
}
