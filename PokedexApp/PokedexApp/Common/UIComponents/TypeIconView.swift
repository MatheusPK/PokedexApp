//
//  TypeIconView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 17/08/22.
//

import Foundation
import UIKit

class TypeIconView: UIView {
    
    let type: PokemonType
    
    var isSelected: Bool = false {
        didSet {
            toggleApperrance()
        }
    }
    
    let typeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(type: PokemonType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func toggleApperrance() {
        let typeImage = type.icon()
        typeImageView.image = isSelected ? typeImage?.withTintColor(.white) : typeImage?.withTintColor(type.color())
        backgroundColor = isSelected ? type.color() : .clear
    }
    
}

extension TypeIconView: ViewCode {
    func setupComponents() {
        addSubview(typeImageView)
    }
    
    func setupConstraints() {
        setupContentView()
        setupTypeImageView()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .clear
        layer.cornerRadius = 25
        typeImageView.image = type.icon()?.withTintColor(type.color())
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
            typeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
