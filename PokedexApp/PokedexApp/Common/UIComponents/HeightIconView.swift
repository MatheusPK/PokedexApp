//
//  HeightIconView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 21/08/22.
//

import Foundation
import UIKit

class HeightIconView: BaseIconView {
    
    let height: PokemonHeight
    
    init(height: PokemonHeight) {
        self.height = height
        super.init()
        super.setup()
        self.iconImageView.image = height.icon()?.withTintColor(height.color())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func toggleApperrance() {
        let typeImage = height.icon()
        iconImageView.image = isSelected ? typeImage?.withTintColor(.white) : typeImage?.withTintColor(height.color())
        backgroundColor = isSelected ? height.color() : .clear
    }
    
}
