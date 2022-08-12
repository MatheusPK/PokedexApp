//
//  HomeViewController.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

protocol HomePresenterOutput: AnyObject {
    func presentPokemonList(pokemonList: [Pokemon])
}

final class HomeViewController: UIViewController {
    
    
    // MARK: - Dependencies
    private let router: HomeRouter
    private let interactor: HomeInteractorInput
    private let mainView: HomeView
    
    // MARK: - Properties
    var pokemons = [Pokemon]() {
        didSet {
            mainView.reloadTableView()
        }
    }
    
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
        mainView.pokemonTableView.delegate = self
        mainView.pokemonTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        interactor.fetchPokemonList()
    }
    
}

// MARK: - UITableViewDataSource/UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        pokemons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.pokemon = pokemons[indexPath.section]
        return cell
    }
}

extension HomeViewController: HomePresenterOutput {
    func presentPokemonList(pokemonList: [Pokemon]) {
        pokemons = pokemonList
    }
}

