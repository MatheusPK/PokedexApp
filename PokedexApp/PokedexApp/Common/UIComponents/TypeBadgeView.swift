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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var typeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
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
        typeImageView.image = type.icon()?.withTintColor(.white)
        typeLabel.text = type.text()
        contentView.backgroundColor = type.color()
        
        addSubview(contentView)
        contentView.addSubview(labelStackView)
        labelStackView.addArrangedSubview(typeImageView)
        labelStackView.addArrangedSubview(typeLabel)
    }
    
    func setupConstraints() {
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            labelStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            labelStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5)
        ])
    }

}




