//
//  SearchViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.search
}
