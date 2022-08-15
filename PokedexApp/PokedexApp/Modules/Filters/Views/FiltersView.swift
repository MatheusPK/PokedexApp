//
//  FiltersView.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

class FiltersView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "dsfrsdfdsf"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .red
    }
    
}
