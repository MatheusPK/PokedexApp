//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Matheus P.K on 28/07/22.
//

import Foundation
import UIKit

class PokemonCell: UIView {
    
    let pokemonId: String
    let pokemonName: String
    let pokemonTypes: [PokemonType]
    let pokemonImageURL: String
    
    let pokemonIdLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.POKEMON_NUMBER
        label.textColor = K.COLORS.TEXT.NUMBER
        return label
    }()
    
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.POKEMON_NAME
        label.textColor = K.COLORS.TEXT.WHITE
        return label
    }()
    
    let pokemonTypeScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let pokemonTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let pokemonInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let pokemonFrontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    init(pokemonId: String, pokemonName: String, pokemonTypes: [PokemonType], pokemonImageURL: String) {
        self.pokemonId = pokemonId
        self.pokemonName = pokemonName
        self.pokemonTypes = pokemonTypes
        self.pokemonImageURL = pokemonImageURL
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonCell: ViewCode {
    func setupComponents() {
        addSubview(contentView)
        contentView.addSubview(pokemonInfoStackView)
        pokemonInfoStackView.addArrangedSubview(pokemonIdLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonNameLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonTypeStackView) // to change to scroll view option change 'pokemonTypeStackView' to pokemonTypeScroll
//        pokemonTypeScroll.addSubview(pokemonTypeStackView)
        
        for type in pokemonTypes {
            pokemonTypeStackView.addArrangedSubview(TypeBadgeView(type: type))
        }
    }
    
    func setupConstraints() {
        setupContentView()
        
        setupPokemonInfoStackView()
//        setupPokemonTypeScrollView()
    }
    
    private func setupContentView() {
        contentView.alignToParentView(self)
        contentView.layer.cornerRadius = 10
    }
    
    private func setupPokemonInfoStackView() {
        NSLayoutConstraint.activate([
            pokemonInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pokemonInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -20),
            pokemonInfoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20)
        ])
    }
    
    private func setupPokemonTypeScrollView() {
        NSLayoutConstraint.activate([
            pokemonTypeScroll.leftAnchor.constraint(equalTo: pokemonInfoStackView.leftAnchor),
            pokemonTypeScroll.rightAnchor.constraint(equalTo: pokemonInfoStackView.rightAnchor),
            pokemonTypeScroll.heightAnchor.constraint(equalTo: pokemonTypeStackView.heightAnchor)
        ])
        
        pokemonTypeStackView.alignToParentView(pokemonTypeScroll)
    }
    
    func setupExtraConfiguration() {
        contentView.backgroundColor = pokemonTypes.first?.backgroundColor()
        pokemonIdLabel.text = pokemonId
        pokemonNameLabel.text = pokemonName
//        pokemonFrontImageView.image = UIImage()
    }
    
    
}
