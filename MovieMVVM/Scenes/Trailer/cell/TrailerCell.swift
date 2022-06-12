//
//  TrailerCell.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import UIKit
import Reusable
import SkeletonView

final class TrailerCell: UITableViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var trailerImageView: UIImageView!
    @IBOutlet private weak var yearLabel: UILabel!
    
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
        nameLabel.showAnimatedGradientSkeleton()
        trailerImageView.showAnimatedGradientSkeleton()
        yearLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        nameLabel.hideSkeleton()
        trailerImageView.hideSkeleton()
        yearLabel.hideSkeleton()
    }
    
    // MARK: - Data
    func setContent(data: Trailer) {
        yearLabel.text = data.infor
        nameLabel.text = data.name
        let urlImage = "https://img.youtube.com/vi/\(data.key)/0.jpg"
        let url = URL(string: urlImage)
        trailerImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.hideAnimation()
        }
    }
}
