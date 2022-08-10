//
//  UIStackViewExtension.swift
//  PokedexApp
//
//  Created by Matheus P.K on 10/08/22.
//

import Foundation
import UIKit

extension UIStackView {
    func clear() {
        arrangedSubviews.forEach { view in
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
