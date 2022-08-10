//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Matheus P.K on 28/07/22.
//

import Foundation
import Kingfisher
import UIKit

struct PokemonInfo {
    let id: Int
    let name: String
    let types: [PokemonType]
    let imageURL: String
}

class PokemonCell: UITableViewCell {
    
    var pokemonInfo: PokemonInfo? {
        didSet {
            setup()
        }
    }
    
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
        let imageView = UIImageView(image: K.IMAGES.PATTERNS.I6X3_LIST_BACKGROUND)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pokeballBackground: UIImageView = {
        let imageView = UIImageView(image: K.IMAGES.PATTERNS.POKEBALL_LIST_BACKGROUND)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        guard let pokemonInfo = pokemonInfo else { return }
        for type in pokemonInfo.types {
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
            pokemonFrontImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
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
        backgroundColor = pokemonInfo?.types.first?.backgroundColor() ?? PokemonType.grass.backgroundColor()
        
        pokemonIdLabel.text = String(format: "#%03d", pokemonInfo?.id ?? 001)
        pokemonNameLabel.text = pokemonInfo?.name ?? "Bulbasaur"
        let url = URL(string: pokemonInfo?.imageURL ?? "")
        pokemonFrontImageView.kf.setImage(
            with: url,
            placeholder: K.IMAGES.PLACEHOLDER.POKEMON_FRONT
        )
    }
}
