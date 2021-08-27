//
//  GenreImageCell.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit
import SDWebImage
import Reusable
import SkeletonView

final class GenreImageCell: UITableViewCell, NibReusable {
    
    // MARK: - Outlet
    @IBOutlet private weak var genreImageView: UIImageView!
    @IBOutlet private weak var genreTitle: UILabel!
    
    // MARK: - Define
    typealias Attribute = [NSAttributedString.Key: Any]
    
    // MARK: - Property
    let attributeUnderline: Attribute = [.underlineStyle: 1]
    
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
        genreImageView.showAnimatedGradientSkeleton()
        genreTitle.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        genreImageView.hideSkeleton()
        genreTitle.hideSkeleton()
    }
    
    // MARK: - Data
    func setContent(data: Genre) {
        let underLineText = NSAttributedString(string: data.name, attributes: attributeUnderline)
        genreTitle.attributedText = underLineText
        genreImageView.image = UIImage(named: data.name)
        hideAnimation()
    }
}
