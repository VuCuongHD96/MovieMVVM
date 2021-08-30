//
//  MovieByGenreCell.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import UIKit
import Reusable

final class MovieByGenreCell: UITableViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
}
