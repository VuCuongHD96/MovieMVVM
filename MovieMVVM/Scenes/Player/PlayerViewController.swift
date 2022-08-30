//
//  PlayerViewController.swift
//  MovieMVVM
//
//  Created by sun on 13/06/2022.
//

import UIKit
import YouTubePlayer

class PlayerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let videoPlayer = YouTubePlayerView(frame: view.bounds)

        if let myVideoURL = URL(string: "https://www.youtube.com/watch?v=5nppX1KUNeE") {
            videoPlayer.loadVideoURL(myVideoURL)
        }
        view = videoPlayer
    }
}
