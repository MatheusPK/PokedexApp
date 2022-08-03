//
//  HomeViewController.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit



final class HomeViewController: UIViewController {
    
    private let router: HomeRouter
    private let interactor: HomeInteractorInput
    private let mainView: HomeView
    
    init(router: HomeRouter, interactor: HomeInteractorInput, mainView: HomeView) {
        self.router = router
        self.interactor = interactor
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        interactor.fetchPokemonList()
    }
    
}

