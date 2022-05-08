//
//  TopCell.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import Reusable

final class TopCell: UICollectionViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    // MARK: - View
    private func setupView() {
        showAnimation()
    }
    
    private func showAnimation() {
        movieImageView.showAnimatedGradientSkeleton()
        yearLabel.showAnimatedGradientSkeleton()
        movieNameLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        movieImageView.hideSkeleton()
        yearLabel.hideSkeleton()
        movieNameLabel.hideSkeleton()
    }
    
    // MARK: - Data
    func setContent(data: Movie) {
        movieNameLabel.text = data.title
        let urlString = URLs.APIImagesOriginalPath + data.posterPathValue
        let url = URL(string: urlString)
        movieImageView.sd_setImage(with: url,
                                   placeholderImage: UIImage(named: "noposter"),
                                   options: .highPriority) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.hideAnimation()
        }
    }
}
