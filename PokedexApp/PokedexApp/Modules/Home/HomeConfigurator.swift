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
        let viewController = HomeViewController(mainView: view)
        return viewController
    }
    
    
}
