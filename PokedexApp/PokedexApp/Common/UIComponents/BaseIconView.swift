//
//  BaseIconView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 21/08/22.
//

import Foundation
import UIKit

class BaseIconView: UIView {
    
    var isSelected: Bool = false {
        didSet {
            toggleApperrance()
        }
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleApperrance() {}
    
}

extension BaseIconView: ViewCode {
    func setupComponents() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
    }
    
    func setupConstraints() {
        setupContentView()
        setupTypeImageView()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .clear
        layer.cornerRadius = 25
        addTapGestureRecognizer { self.isSelected.toggle() }
    }
    
    private func setupContentView() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTypeImageView() {
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
