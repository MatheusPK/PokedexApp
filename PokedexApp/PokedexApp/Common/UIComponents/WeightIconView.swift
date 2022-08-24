//
//  WeightIconView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 24/08/22.
//

import Foundation
import UIKit

class WeightIconView: BaseIconView {
    
    let weight: PokemonWeight
    
    init(weight: PokemonWeight) {
        self.weight = weight
        super.init()
        super.setup()
        self.iconImageView.image = weight.icon()?.withTintColor(weight.color())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func toggleApperrance() {
        let typeImage = weight.icon()
        iconImageView.image = isSelected ? typeImage?.withTintColor(.white) : typeImage?.withTintColor(weight.color())
        backgroundColor = isSelected ? weight.color() : .clear
    }
    
}
