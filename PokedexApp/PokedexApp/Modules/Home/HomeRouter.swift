//
//  HomeRouter.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

class HomeRouter {
    weak var viewController: UIViewController?
    
    func routeToGeneration() {}
    func routeToSort() {}
    func routeToFilter() {
        let vc = FiltersConfigurator.make(with: .init())
        viewController?.navigationController?.present(vc, animated: true)
    }
    
}
