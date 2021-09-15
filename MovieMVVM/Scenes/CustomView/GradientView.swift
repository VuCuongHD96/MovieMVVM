//
//  GradientView.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import UIKit
import Pastel

class GradientView: UIView {
    
    struct Constant {
        static let colorOne = UIColor(named: "ColorOne")!
        static let colorTwo = UIColor(named: "ColorTwo")!
    }
    
    override func draw(_ rect: CGRect) {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientColor()
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
}
