//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let pokemonCell: PokemonCell = {
        let pokemonCell = PokemonCell(pokemonId: "001", pokemonName: "Bulbasaur", pokemonTypes: [.grass, .poison], pokemonImageURL: "kasjdhfasj")
        pokemonCell.translatesAutoresizingMaskIntoConstraints = false
        return pokemonCell
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    func setupComponents() {
        addSubview(pokemonCell)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pokemonCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonCell.widthAnchor.constraint(equalToConstant: 334),
            pokemonCell.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    func setupExtraConfiguration() {
        backgroundColor = K.COLORS.BACKGROUND.WHITE
    }
    
    
}
