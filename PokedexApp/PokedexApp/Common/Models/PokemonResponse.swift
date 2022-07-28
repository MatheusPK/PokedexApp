//
//  PokemonResponse.swift
//  PokedexApp
//
//  Created by Matheus P.K on 27/07/22.
//

import Foundation

struct PokemonResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let result: [PokemonResult]
}

struct PokemonResult: Codable {
    let name: String
    let url : String
}
