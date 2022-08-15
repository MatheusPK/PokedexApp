//
//  FiltersConfigurator.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

class FiltersConfigurator {
    
    struct Dependencies {}
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        
        let view = FiltersView()
        let router = FiltersRouter()
        
        let presenter = FiltersPresenter()
        let interator = FiltersInteractor(presenter: presenter)
        
        let viewController = FiltersViewController(router: router, interactor: interator, mainView: view)
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
        
        return viewController
    }
}
