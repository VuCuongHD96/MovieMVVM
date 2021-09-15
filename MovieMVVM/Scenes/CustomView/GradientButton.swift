//
//  GradientButton.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import UIKit
import Pastel

final class GradientButton: UIButton {

    // MARK: - Define
    struct Constant {
        static let colorOne = UIColor(named: "ColorOne")!
        static let colorTwo = UIColor(named: "ColorTwo")!
        static let fontName = "HelveticaNeue-Medium"
    }
    typealias TextAttributed = [NSAttributedString.Key: Any]
    
    // MARK: - Property
    var title = ""
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientColor()
        setupButtonText()
    }
    
    // MARK: - View
    private func setupGradientColor() {
        let pastelView = PastelView(frame: bounds)
        pastelView.startPastelPoint = .left
        pastelView.endPastelPoint = .right
        pastelView.animationDuration = 3.0
        pastelView.setColors([Constant.colorOne, Constant.colorTwo])
        pastelView.startAnimation()
        insertSubview(pastelView, at: 0)
    }
    
    private func setupButtonText() {
        let font = UIFont(name: Constant.fontName, size: 15)!
        let attributed: TextAttributed = [
            .foregroundColor: UIColor.white,
            .underlineStyle: 1,
            .font: font
        ]
        let attributedString = NSAttributedString(string: title, attributes: attributed)
        setAttributedTitle(attributedString, for: .normal)
    }
}
