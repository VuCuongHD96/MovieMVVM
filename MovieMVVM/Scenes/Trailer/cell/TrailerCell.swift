//
//  TrailerCell.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import UIKit
import Reusable

final class TrailerCell: UITableViewCell, NibReusable {

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
    
    // MARK: - Data
    func setContent() {
        
    }
}
