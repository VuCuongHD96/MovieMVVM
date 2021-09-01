//
//  SearchTextField.swift
//  MovieMVVM
//
//  Created by admin on 9/1/21.
//

import UIKit

final class SearchTextField: UITextField {
  
    let inset: CGFloat = 30

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: 0)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: 0)
    }
}
