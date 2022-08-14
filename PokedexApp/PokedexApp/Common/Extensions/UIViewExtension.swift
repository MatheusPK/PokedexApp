//
//  UIViewExtension.swift
//  PokedexApp
//
//  Created by Matheus P.K on 06/08/22.
//

import Foundation
import UIKit

extension UIView {
    func alignToParentView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func addShadow(opacity: Float, offset: CGSize, radius: CGFloat, color: CGColor = UIColor.black.cgColor) {
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
}
