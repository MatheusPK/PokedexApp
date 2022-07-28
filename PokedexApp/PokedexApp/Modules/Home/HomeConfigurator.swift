//
//  HomeConfigurator.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

final class HomeConfigurator: ModuleFactory {
    
    struct Dependencies {}
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        
        let view = HomeView()
        let router = HomeRouter()
        
        let worker = PokemonListWorker()
        let presenter = HomePresenter()
        let interator = HomeInteractor(worker: worker, presenter: presenter)
        
        let viewController = HomeViewController(router: router, interactor: interator, mainView: view)
        
        presenter.viewController = viewController
        
        return viewController
    }
    
    
}
