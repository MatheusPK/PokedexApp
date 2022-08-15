//
//  HomePresenter.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation

protocol HomePresenterOutput: AnyObject {
    func presentPokemonList(pokemonList: [Pokemon])
}

class HomePresenter {
    weak var viewController: HomePresenterOutput?
}

extension HomePresenter: HomeInteractorOutput {
    func presentPokemonList(pokemonList: [Pokemon]) {
        viewController?.presentPokemonList(pokemonList: pokemonList)
    }
}
