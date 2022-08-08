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
    
    let dotPatternDecoration: UIImageView = {
        let imageView = UIImageView(image: K.IMAGES.PATTERN_6X3_LIST_BACKGROUND)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pokeballBackground: UIImageView = {
        let imageView = UIImageView(image: K.IMAGES.POKEBALL_LIST_BACKGROUND)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(dotPatternDecoration)
        addSubview(pokeballBackground)
        addSubview(pokemonFrontImageView)
        addSubview(pokemonInfoStackView)
        
        pokemonInfoStackView.addArrangedSubview(pokemonIdLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonNameLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonTypeStackView) // to change to scroll view option change 'pokemonTypeStackView' to pokemonTypeScroll
//        pokemonTypeScroll.addSubview(pokemonTypeStackView)
        for type in pokemonTypes {
            pokemonTypeStackView.addArrangedSubview(TypeBadgeView(type: type))
        }
    }
    
    func setupConstraints() {
        setupPokemonInfoStackView()
//        setupPokemonTypeScrollView()
        setupPokemonFrontImageView()
        setupDotPatternImageView()
        setupPokeballbackground()
    }
    
    private func setupPokemonInfoStackView() {
        NSLayoutConstraint.activate([
            pokemonInfoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            pokemonInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -20),
            pokemonInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
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
    
    private func setupPokemonFrontImageView() {
        NSLayoutConstraint.activate([
            pokemonFrontImageView.heightAnchor.constraint(equalToConstant: 130),
            pokemonFrontImageView.widthAnchor.constraint(equalToConstant: 130),
            pokemonFrontImageView.topAnchor.constraint(equalTo: topAnchor, constant: -25),
            pokemonFrontImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            pokemonFrontImageView.leftAnchor.constraint(equalTo: pokemonInfoStackView.rightAnchor, constant: 43),
            pokemonFrontImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10),
        ])
    }
    
    private func setupDotPatternImageView() {
        NSLayoutConstraint.activate([
            dotPatternDecoration.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dotPatternDecoration.rightAnchor.constraint(equalTo: pokemonFrontImageView.leftAnchor, constant: -30),
            dotPatternDecoration.heightAnchor.constraint(equalToConstant: 32),
            dotPatternDecoration.widthAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    private func setupPokeballbackground() {
        NSLayoutConstraint.activate([
            pokeballBackground.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            pokeballBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
            pokeballBackground.rightAnchor.constraint(equalTo: rightAnchor, constant: 15),
            pokeballBackground.heightAnchor.constraint(equalToConstant: 145),
            pokeballBackground.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
    
    func setupExtraConfiguration() {
        layer.cornerRadius = 10
        backgroundColor = pokemonTypes.first?.backgroundColor()
        pokemonIdLabel.text = pokemonId
        pokemonNameLabel.text = pokemonName
        pokemonFrontImageView.image = UIImage(named: "pokemonFrontImagePlaceholder")
    }
}
