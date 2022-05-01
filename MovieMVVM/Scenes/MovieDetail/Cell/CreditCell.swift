//
//  CreditCell.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import UIKit
import Reusable
import SDWebImage

final class CreditCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var personImage: UIImageView!
    @IBOutlet private weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
    }
    
    func setContent(person: Person) {
        let url = URL(string: URLs.APIImagesOriginalPath + person.profilePathValue)
        personImage.sd_setImage(with: url) 
        personNameLabel.text = person.name
    }
}
