//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var pokemons = [Pokemon]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonTableView.reloadData()
            }
            
        }
    }
    
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
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension HomeView: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        pokemons.count
    }
    
}

// MARK: - UITableViewDataSource
extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell

        let pokemon = pokemons[indexPath.section]
        let pokemonId = pokemon.id
        let pokemonName = pokemon.name
        var pokemonTypes = [PokemonType]()
        let pokemonImageURL = pokemon.sprites?.other?.officialArtwork?.frontDefault

        if let types = pokemon.types, !types.isEmpty {
            for type in types {
                pokemonTypes.append(type.type?.name ?? .grass)
            }
        }

        cell.pokemonInfo = PokemonInfo(id: pokemonId!, name: pokemonName!, types: pokemonTypes, imageURL: pokemonImageURL!)

        return cell
    }
}
