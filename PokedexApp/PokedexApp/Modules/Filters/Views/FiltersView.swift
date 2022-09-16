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
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let typeContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    let heightsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let heightsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let heightsContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let weightsLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Weights"
        return label
    }()
    
    let weightsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let weightsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let weightsContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let numberRangeLabel: UILabel = {
        let label = UILabel()
        label.font = K.FONTS.FILTER_TITLE
        label.textColor = K.COLORS.TEXT.BLACK
        label.text = "Number Range"
        return label
    }()
    
    let numberRangeSlider: RangeSlider = {
        let slider = RangeSlider(minValue: 1, maxValue: 898)
        return slider
    }()
    
    let numberRangeContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let resetButton: PokeButton = {
        return PokeButton(title: "Reset", size: .medium)
    }()
    
    let applyButton: UIButton = {
        return PokeButton(title: "Apply", size: .medium)
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let filtersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let filtersScrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    let filtersContentView: UIView = {
        return UIView()
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
        
        heightsContentStackView.addArrangedSubview(heightsLabel)
        heightsContentStackView.addArrangedSubview(heightsScrollView)
        heightsScrollView.addSubview(heightsStackView)
        PokemonHeight.allCases.forEach { height in heightsStackView.addArrangedSubview(HeightIconView(height: height)) }
        
        weightsContentStackView.addArrangedSubview(weightsLabel)
        weightsContentStackView.addArrangedSubview(weightsScrollView)
        weightsScrollView.addSubview(weightsStackView)
        PokemonWeight.allCases.forEach { weight in weightsStackView.addArrangedSubview(WeightIconView(weight: weight)) }
        
        numberRangeContentStackView.addArrangedSubview(numberRangeLabel)
        numberRangeContentStackView.addArrangedSubview(numberRangeSlider)
        
        buttonsStackView.addArrangedSubview(resetButton)
        buttonsStackView.addArrangedSubview(applyButton)
        
        filtersStackView.addArrangedSubview(headerContentStackView)
        filtersStackView.addArrangedSubview(typeContentStackView)
        filtersStackView.addArrangedSubview(weaknessesContentStackView)
        filtersStackView.addArrangedSubview(heightsContentStackView)
        filtersStackView.addArrangedSubview(weightsContentStackView)
        filtersStackView.addArrangedSubview(numberRangeContentStackView)
        filtersStackView.addArrangedSubview(buttonsStackView)
        
        filtersStackView.setCustomSpacing(50, after: numberRangeContentStackView)
        
        addSubview(filtersScrollView)
        filtersScrollView.addSubview(filtersContentView)
        filtersContentView.addSubview(filtersStackView)
    }
    
    func setupConstraints() {
        setupFiltersScrollView()
        setupFiltersContentView()
        setupFiltersStackView()
        setupHeaderContentView()
        setupTypeScrollView()
        setupWeaknessesScrollView()
        setupHeightsScrollView()
        setupWeightsScrollView()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
    }
    
    private func setupFiltersScrollView() {
        filtersScrollView.translatesAutoresizingMaskIntoConstraints = false
        filtersScrollView.alignToParentView(self)
        filtersScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

    }
    
    private func setupFiltersContentView() {
        filtersContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filtersContentView.topAnchor.constraint(equalTo: filtersScrollView.topAnchor),
            filtersContentView.bottomAnchor.constraint(equalTo: filtersScrollView.bottomAnchor),
            filtersContentView.centerXAnchor.constraint(equalTo: filtersScrollView.centerXAnchor),
            filtersContentView.widthAnchor.constraint(equalTo: filtersScrollView.widthAnchor),
            filtersContentView.heightAnchor.constraint(equalTo: filtersStackView.heightAnchor, constant: 65)
        ])
    }
    
    private func setupFiltersStackView() {
        NSLayoutConstraint.activate([
            filtersStackView.topAnchor.constraint(equalTo: filtersContentView.topAnchor, constant: 30),
            filtersStackView.leftAnchor.constraint(equalTo: filtersContentView.leftAnchor, constant: 40)
        ])
    }
    
    private func setupHeaderContentView() {
        headerContentStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
    }
    
    private func setupTypeScrollView() {
        typeStackView.alignToParentView(typeScrollView)
        typeStackView.heightAnchor.constraint(equalTo: typeScrollView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    private func setupWeaknessesScrollView() {
        weaknessesStackView.alignToParentView(weaknessesScrollView)
        weaknessesStackView.heightAnchor.constraint(equalTo: weaknessesScrollView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    private func setupHeightsScrollView() {
        heightsStackView.alignToParentView(heightsScrollView)
        heightsStackView.heightAnchor.constraint(equalTo: heightsScrollView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    private func setupWeightsScrollView() {
        weightsStackView.alignToParentView(weightsScrollView)
        weightsStackView.heightAnchor.constraint(equalTo: weightsScrollView.heightAnchor, multiplier: 0.9).isActive = true
        buttonsStackView.widthAnchor.constraint(equalTo: filtersStackView.widthAnchor).isActive = true
    }
    
}
