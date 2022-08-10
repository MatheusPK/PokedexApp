//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
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
        addSubview(pokemonTableView)
    }
    
    func setupConstraints() {
        setupPokemonTableView()
    }
    
    private func setupPokemonTableView() {
        NSLayoutConstraint.activate([
            pokemonTableView.topAnchor.constraint(equalTo: topAnchor),
            pokemonTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            pokemonTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ])
    }
    
    func setupExtraConfiguration() {
        backgroundColor = K.COLORS.BACKGROUND.WHITE
    }
}
