//
//  MovieByGenreViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class MovieByGenreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieByGenreViewController: StoryboardSceneBased {
    
    static var sceneStoryboard = StoryBoard.movieByGenre
}
