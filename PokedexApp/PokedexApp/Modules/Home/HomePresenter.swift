//
//  HomePresenter.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation

protocol HomePresenterOutput {
    func presentPokemonList(pokemonList: [Pokemon])
}

class HomePresenter {
    weak var viewController: HomeViewController?
}

extension HomePresenter: HomePresenterOutput {
    func presentPokemonList(pokemonList: [Pokemon]) {
        
    }
}
