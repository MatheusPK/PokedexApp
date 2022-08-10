//
//  HomeView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var pokemons = [Pokemon]()
    
    let pokemonTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonCell.self, forCellReuseIdentifier: "PokemonCell")
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

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: -
extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else {  fatalError("Unable to create cell")
        }
        
        if cell.pokemonInfo != nil {
            return cell
        } 
        
        let pokemon = pokemons[indexPath.row]
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
