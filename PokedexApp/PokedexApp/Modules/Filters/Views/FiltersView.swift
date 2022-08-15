//
//  FiltersView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

class FiltersView: UIView {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FiltersView: ViewCode {
    func setupComponents() {}
    
    func setupConstraints() {}
    
    func setupExtraConfiguration() {}
    
}
