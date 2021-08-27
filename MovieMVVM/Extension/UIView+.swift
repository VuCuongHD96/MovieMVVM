//
//  UIView+.swift
//  MovieMVVM
//
//  Created by admin on 8/27/21.
//

import UIKit

extension UIView {
    
    func setGradient(colorOne: UIColor, colorTwo: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = self.layer.frame
        self.layer.insertSublayer(gradient, at: 0)
    }
}
