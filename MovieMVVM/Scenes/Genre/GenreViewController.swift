//
//  GenreViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import Reusable

final class GenreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

}

extension GenreViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.genre
}
