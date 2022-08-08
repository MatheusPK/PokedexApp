//
//  TypeBadgeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 03/08/22.
//

import Foundation
import UIKit

class TypeBadgeView: UIView {
    
    let type: PokemonType
    
    var typeLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.POKEMON_TYPE
        label.textColor = K.COLORS.TEXT.WHITE
        return label
    }()
    
    var typeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(type : PokemonType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TypeBadgeView: ViewCode {
    func setupComponents() {
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(typeImageView)
        labelStackView.addArrangedSubview(typeLabel)
    }
    
    func setupConstraints() {
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            labelStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            labelStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])
    }
    
    func setupExtraConfiguration() {
        layer.cornerRadius = 3
        backgroundColor = type.color()
        
        typeImageView.image = type.icon()?.withTintColor(.white)
        typeLabel.text = type.text()
    }

}




