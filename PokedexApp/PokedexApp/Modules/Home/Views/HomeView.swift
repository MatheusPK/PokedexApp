//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
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
    
//    let pokemonSearchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.st
//    }()
    
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(pokemonTableView)
    }
    
    func setupConstraints() {
        setupPokemonTableView()
        setupTitleLabel()
        setupSubtitleLabel()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = K.COLORS.BACKGROUND.WHITE
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
    
    private func setupPokemonTableView() {
        NSLayoutConstraint.activate([
            pokemonTableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 45),
            pokemonTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            pokemonTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
    
}
