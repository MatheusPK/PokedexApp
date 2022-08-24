//
//  TypeIconView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 17/08/22.
//

import Foundation
import UIKit

class TypeIconView: BaseIconView {
    
    let type: PokemonType
    
    init(type: PokemonType) {
        self.type = type
        super.init()
        super.setup()
        self.iconImageView.image = type.icon()?.withTintColor(type.color())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func toggleApperrance() {
        let typeImage = type.icon()
        iconImageView.image = isSelected ? typeImage?.withTintColor(.white) : typeImage?.withTintColor(type.color())
        backgroundColor = isSelected ? type.color() : .clear
    }
    
}
