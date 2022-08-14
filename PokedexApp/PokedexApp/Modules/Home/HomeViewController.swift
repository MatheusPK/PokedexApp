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
    var filteredPokemons = [Pokemon]() {
        didSet {
            mainView.reloadTableView()
        }
    }
    
    var pokemons = [Pokemon]() {
        didSet {
            filteredPokemons = pokemons
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
        mainView.pokemonSearchBar.delegate = self
        mainView.pokemonTableView.delegate = self
        mainView.pokemonTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        interactor.fetchPokemonList()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK: - UITableViewDataSource/UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.5,0.5,0.5)
        UIView.animate(withDuration: 0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredPokemons.count
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
        cell.pokemon = filteredPokemons[indexPath.section]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.placeholder = ""
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            searchBar.placeholder = "What Pokémon are you looking for?"
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredPokemons = pokemons
        } else {
            self.filteredPokemons = pokemons.filter {
                guard let id = $0.id, let name = $0.name else { return false }
                let hasMatchedName = name.range(of: searchText, options: [.anchored, .caseInsensitive, .diacriticInsensitive]) != nil
                let hasMatchedId = String(id).range(of: searchText, options: [.anchored, .diacriticInsensitive]) != nil
                return hasMatchedName || hasMatchedId
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension HomeViewController: HomePresenterOutput {
    func presentPokemonList(pokemonList: [Pokemon]) {
        pokemons = pokemonList
    }
}

