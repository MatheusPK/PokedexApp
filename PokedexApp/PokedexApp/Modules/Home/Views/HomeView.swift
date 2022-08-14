//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let pokeballBackground: UIImageView = {
        let imageView = UIImageView(image: K.IMAGES.PATTERNS.POKEBALL_HOME_BACKGROUND)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = K.FONTS.APPLICATION_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Pokédex"
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = K.FONTS.DESCRIPTION
        label.textColor = K.COLORS.TEXT.GREY
        label.text = "Search for Pokémon by name or using the National Pokédex number."
        label.numberOfLines = 2
        return label
    }()
    
    let pokemonSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "What Pokémon are you looking for?"
        searchBar.searchTextField.font = K.FONTS.DESCRIPTION
        searchBar.barTintColor = K.COLORS.BACKGROUND.DEFAULT_INPUT
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = K.COLORS.TYPE.PSYCHIC
        return searchBar
    }()
    
    let pokemonTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonCell.self, forCellReuseIdentifier: "PokemonCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
        }
    }
    
}

// MARK: - ViewCode
extension HomeView: ViewCode {
    func setupComponents() {
        addSubview(pokeballBackground)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(pokemonSearchBar)
        addSubview(pokemonTableView)
    }
    
    func setupConstraints() {
        setupPokeballBackground()
        setupTitleLabel()
        setupSubtitleLabel()
        setupSearchBar()
        setupPokemonTableView()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = K.COLORS.BACKGROUND.WHITE
        pokemonTableView.keyboardDismissMode = .onDrag
    }
    
    private func setupPokeballBackground() {
        NSLayoutConstraint.activate([
            pokeballBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokeballBackground.centerYAnchor.constraint(equalTo: topAnchor),
            pokeballBackground.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            pokeballBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40)
        ])
    }
    
    private func setupSubtitleLabel() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            subtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
    
    private func setupSearchBar() {
        NSLayoutConstraint.activate([
            pokemonSearchBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 25),
            pokemonSearchBar.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            pokemonSearchBar.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
    
    private func setupPokemonTableView() {
        NSLayoutConstraint.activate([
            pokemonTableView.topAnchor.constraint(equalTo: pokemonSearchBar.bottomAnchor, constant: 0),
            pokemonTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonTableView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            pokemonTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
    
}
