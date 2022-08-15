//
//  FiltersInteractor.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation

protocol FiltersInteractorInput {}
protocol FiltersInteractorOutput {}

class FiltersInteractor {
//    private let worker:
    private let presenter: FiltersInteractorOutput
    
    init(presenter: FiltersInteractorOutput) {
        self.presenter = presenter
    }
}

extension FiltersInteractor: FiltersInteractorInput {
    
}

