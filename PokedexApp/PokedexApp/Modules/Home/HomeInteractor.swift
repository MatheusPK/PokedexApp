//
//  HomeInteractor.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {
    func presentPokemonList(pokemonList: [Pokemon])
}

protocol HomeInteractorInput {
    func fetchPokemonList()
}

final class HomeInteractor {
    private let worker: PokemonListWorking
    private let presenter: HomeInteractorOutput
    
    init(worker: PokemonListWorking, presenter: HomeInteractorOutput) {
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
