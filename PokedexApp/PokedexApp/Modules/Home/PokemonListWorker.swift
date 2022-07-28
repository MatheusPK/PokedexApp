//
//  PokemonListWorker.swift
//  PokedexApp
//
//  Created by Matheus P.K on 28/07/22.
//

import Foundation

protocol PokemonListWorking {
    func fetchPokemonList() async throws -> [Pokemon]
}

final class PokemonListWorker {
    // should have a network layer
}

extension PokemonListWorker: PokemonListWorking {
    
    enum PokemonError: Error {
        case invalidURL
        case missingData
    }
    
    enum PokemonOutput {
        case success(pokemon: Pokemon)
        case failure
    }
    
    func fetchPokemonList() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            throw PokemonError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let pokemonResponse = try JSONDecoder().decode(PokemonResponse.self, from: data)
        let allPokemons = await withTaskGroup(of: PokemonOutput.self, returning: [Pokemon].self) { taskGroup in
            
            for result in pokemonResponse.results {
                taskGroup.addTask {
                    do {
                        let pokemon = try await self.fetchPokemon(with: result.url)
                        return PokemonOutput.success(pokemon: pokemon)
                    } catch {
                        return PokemonOutput.failure
                    }
                }
            }
            
            var pokemonList = [Pokemon]()
            
            for await pokemonOutput in taskGroup {
                switch pokemonOutput {
                case .success(let pokemon):
                    pokemonList.append(pokemon)
                case .failure:
                    continue
                }
            }
            
            return pokemonList.sorted(by: {$0.id ?? 0 < $1.id ?? 0})
        }
        return allPokemons
    }
    
    private func fetchPokemon(with url: String) async throws -> Pokemon {
        let url = URL(string: url)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
        
        return pokemon
    }
    
    
}
