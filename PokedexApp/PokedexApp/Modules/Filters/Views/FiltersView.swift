//
//  FiltersView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

class FiltersView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.POKEMON_NAME
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Filters"
        return label
    }()
    
    let subtitleLable: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.DESCRIPTION
        label.textColor = K.COLORS.TEXT.GREY
        label.text = "Use advanced search to explore Pokémon by type, weakness, height and more!"
        label.numberOfLines = 0
        return label
    }()
    
    let headerContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Types"
        return label
    }()
    
    let typeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let typeContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let weaknessesLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Weaknesses"
        return label
    }()
    
    let weaknessesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let weaknessesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let weaknessesContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let heightsLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Heights"
        return label
    }()
    
    let weightsLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.POKEMON_NAME
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Weights"
        return label
    }()
    
    let numberRangeLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Number Range"
        return label
    }()
    
    let filtersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FiltersView: ViewCode {
    func setupComponents() {
        headerContentStackView.addArrangedSubview(titleLabel)
        headerContentStackView.addArrangedSubview(subtitleLable)
        
        typeContentStackView.addArrangedSubview(typeLabel)
        typeContentStackView.addArrangedSubview(typeScrollView)
        typeScrollView.addSubview(typeStackView)
        PokemonType.allCases.forEach { type in typeStackView.addArrangedSubview(TypeIconView(type: type)) }
        
        weaknessesContentStackView.addArrangedSubview(weaknessesLabel)
        weaknessesContentStackView.addArrangedSubview(weaknessesScrollView)
        weaknessesScrollView.addSubview(weaknessesStackView)
        PokemonType.allCases.forEach { type in weaknessesStackView.addArrangedSubview(TypeIconView(type: type)) }
        
        filtersStackView.addArrangedSubview(headerContentStackView)
        filtersStackView.addArrangedSubview(typeContentStackView)
        filtersStackView.addArrangedSubview(weaknessesContentStackView)
        
        addSubview(filtersStackView)
    }
    
    func setupConstraints() {
        setupFiltersStackView()
        setupHeaderContentView()
        setupTypeScrollView()
        setupWeaknessesScrollView()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
    }
    
    private func setupFiltersStackView() {
        NSLayoutConstraint.activate([
            filtersStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            filtersStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40)
        ])
    }
    
    private func setupHeaderContentView() {
        headerContentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
    }
    
    private func setupTypeScrollView() {
        typeScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        typeStackView.alignToParentView(typeScrollView)
        typeStackView.heightAnchor.constraint(equalTo: typeScrollView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    private func setupWeaknessesScrollView() {
        weaknessesScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        weaknessesStackView.alignToParentView(weaknessesScrollView)
        weaknessesStackView.heightAnchor.constraint(equalTo: weaknessesScrollView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
}
