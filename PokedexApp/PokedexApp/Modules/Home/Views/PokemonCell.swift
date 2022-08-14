//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Matheus P.K on 28/07/22.
//

import Foundation
import Kingfisher
import UIKit

class PokemonCell: UITableViewCell {
    
    var pokemon: Pokemon? {
        didSet {
            configure()
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
        let imageView = UIImageView(image: K.IMAGES.PATTERNS.POKEBALL_CELL_BACKGROUND)
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }, completion: { finished in
                UIView.animate(withDuration: 0.2) {
                    self.transform = .identity
                }
            })
        }
    }
    
    
    
    private func configure() {
        guard let pokemonId = pokemon?.id,
              let pokemonName = pokemon?.name,
              let pokemonImageURL = pokemon?.sprites?.other?.officialArtwork?.frontDefault,
              let url = URL(string: pokemonImageURL),
              let pokemonTypes = pokemon?.types else { return }
    
        pokemonIdLabel.text = String(format: "#%003i", pokemonId)
        pokemonNameLabel.text = pokemonName.capitalized
        pokemonFrontImageView.kf.setImage(with: url, placeholder: K.IMAGES.PLACEHOLDER.POKEMON_FRONT)
        
        pokemonTypeStackView.clear()
        pokemonTypes.forEach({
            if let type = $0.type?.name {
                pokemonTypeStackView.addArrangedSubview(TypeBadgeView(type: type))
            }
        })
        
        contentView.backgroundColor = pokemonTypes.first?.type?.name?.backgroundColor() ?? PokemonType.fire.backgroundColor()
    }
    
}

extension PokemonCell: ViewCode {
    func setupComponents() {
        contentView.addSubview(dotPatternDecoration)
        contentView.addSubview(pokeballBackground)
        contentView.addSubview(pokemonInfoStackView)
        contentView.addSubview(pokemonFrontImageView)
        
        pokemonInfoStackView.addArrangedSubview(pokemonIdLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonNameLabel)
        pokemonInfoStackView.addArrangedSubview(pokemonTypeStackView)
    }
    
    func setupConstraints() {
        setupPokemonInfoStackView()
        setupPokemonFrontImageView()
        setupDotPatternImageView()
        setupPokeballbackground()
    }
    
    func setupExtraConfiguration() {
        contentView.layer.cornerRadius = 10
        backgroundConfiguration = .clear()
    }
    
    private func setupPokemonInfoStackView() {
        NSLayoutConstraint.activate([
            pokemonInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pokemonInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -20),
            pokemonInfoStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20)
        ])
    }
    
    private func setupPokemonFrontImageView() {
        NSLayoutConstraint.activate([
            pokemonFrontImageView.heightAnchor.constraint(equalToConstant: 130),
            pokemonFrontImageView.widthAnchor.constraint(equalToConstant: 130),
            pokemonFrontImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -25),
            pokemonFrontImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            pokemonFrontImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
    
    private func setupDotPatternImageView() {
        NSLayoutConstraint.activate([
            dotPatternDecoration.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dotPatternDecoration.rightAnchor.constraint(equalTo: pokemonFrontImageView.leftAnchor, constant: -30),
            dotPatternDecoration.heightAnchor.constraint(equalToConstant: 32),
            dotPatternDecoration.widthAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    private func setupPokeballbackground() {
        NSLayoutConstraint.activate([
            pokeballBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -15),
            pokeballBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15),
            pokeballBackground.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 15),
            pokeballBackground.heightAnchor.constraint(equalToConstant: 145),
            pokeballBackground.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
}
