//
//  MovieByGenreCell.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import UIKit
import Reusable
import SDWebImage

final class MovieByGenreCell: UITableViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
        showAnimation()
    }
    
    private func showAnimation() {
        movieImageView.showAnimatedGradientSkeleton()
        movieName.showAnimatedGradientSkeleton()
        releaseDateLabel.showAnimatedGradientSkeleton()
        descriptionLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        movieImageView.hideSkeleton()
        movieName.hideSkeleton()
        releaseDateLabel.hideSkeleton()
        descriptionLabel.hideSkeleton()
    }
    
    // MARK: - Data
    func setContent(data: Movie) {
        releaseDateLabel.text = data.infor
        movieName.text = data.title
        descriptionLabel.text = data.overview
        let urlString = URLs.APIImagesOriginalPath + data.posterPath
        let url = URL(string: urlString)
        movieImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.hideAnimation()
        }
    }
}
