//
//  HomeInteractor.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation

protocol HomeInteractorInput {
    func fetchPokemonList()
}

final class HomeInteractor {
    private let worker: PokemonListWorking
    private let presenter: HomePresenterOutput
    
    init(worker: PokemonListWorking, presenter: HomePresenterOutput) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorInput {
    func fetchPokemonList() {
        Task {
            do {
                let pokemons = try await worker.fetchPokemonList()
                presenter.presentPokemonList(pokemonList: pokemons)
            } catch {
                print("Failed with error: \(error)")
            }
        }
    }
}
