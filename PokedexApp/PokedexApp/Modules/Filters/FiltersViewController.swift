//
//  FiltersViewController.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

class FiltersViewController: UIViewController {
    // MARK: - Dependecies
    let router: FiltersRouter
    let interactor: FiltersInteractorInput
    let mainView: FiltersView
    
    init(router: FiltersRouter, interactor: FiltersInteractorInput, mainView: FiltersView) {
        self.router = router
        self.interactor = interactor
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
}

// MARK: - FiltersPresenterOutput
extension FiltersViewController: FiltersPresenterOutput {}