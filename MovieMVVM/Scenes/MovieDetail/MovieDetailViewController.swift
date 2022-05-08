//
//  MovieDetailViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable
import Cosmos

final class MovieDetailViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var backGroundImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var rateView: CosmosView!
    @IBOutlet private weak var overViewLabel: UILabel!
    @IBOutlet private weak var castCollectionView: UICollectionView!
    
    // MARK: - Property
    var viewModel: MovieDetailViewModelType! {
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
        setupData()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        setupMovieData(viewModel.movieResponse)
        setupCreditCollectionView()
    }
    
    // MARK: - Action
    @IBAction func playAction(_ sender: Any) {
        viewModel.playDidTap = Void()
    }
    
    @IBAction func backAction(_ sender: Any) {
        viewModel.backDidTap = Void()
    }
}

extension MovieDetailViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        showAnimation()
    }
    
    private func showAnimation() {
        movieNameLabel.showAnimatedGradientSkeleton()
        releaseDateLabel.showAnimatedGradientSkeleton()
        rateView.showAnimatedGradientSkeleton()
        overViewLabel.showAnimatedGradientSkeleton()
        backGroundImageView.showAnimatedGradientSkeleton()
        posterImageView.showAnimatedGradientSkeleton()
        genreLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        movieNameLabel.hideSkeleton()
        releaseDateLabel.hideSkeleton()
        rateView.hideSkeleton()
        overViewLabel.hideSkeleton()
        backGroundImageView.hideSkeleton()
        posterImageView.hideSkeleton()
        genreLabel.hideSkeleton()
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
    
    private func setupMovieData(_ movie: Movie) {
        movieNameLabel.text = movie.originalTitle
        releaseDateLabel.text = movie.infor
        rateView.rating = movie.voteStar
        overViewLabel.text = movie.overview
        genreLabel.text = movie.arrayGenre
        setupDispatchGroup(movie)
    }
    
    private func setupDispatchGroup(_ movie: Movie) {
        let backDropUrlSring = URLs.APIImagesOriginalPath + movie.posterPathValue
        let backDropURL = URL(string: backDropUrlSring)
        let posterUrlString = URLs.APIImagesOriginalPath + movie.posterPathValue
        let posterURL = URL(string: posterUrlString)
        let group = DispatchGroup()
        group.enter()
        posterImageView.sd_setImage(with: posterURL) { (_, _, _, _) in
            group.leave()
        }
        group.enter()
        backGroundImageView.sd_setImage(with: backDropURL) { (_, _, _, _) in
            group.leave()
        }
        group.notify(queue: .main) { [weak self]  in
            guard let self = self else { return }
            self.hideAnimation()
        }
    }
    
    private func setupCreditCollectionView() {
        castCollectionView.register(cellType: CreditCell.self)
        castCollectionView.dataSource = viewModel.creditDataSourceDelegate
        castCollectionView.delegate = viewModel.creditDataSourceDelegate
        castCollectionView.reloadData()
    }
}

extension MovieDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.movieDetail
}
