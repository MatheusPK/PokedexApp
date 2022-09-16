//
//  CustomToggleButton.swift
//  PokedexApp
//
//  Created by Matheus P.K on 01/09/22.
//

import Foundation
import UIKit

class CustomToggleButton: UIView {
    
    let innerCircle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = K.COLORS.BACKGROUND.WHITE
        view.layer.cornerRadius = 6
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomToggleButton: ViewCode {
    func setupComponents() {
        addSubview(innerCircle)
    }
    
    func setupConstraints() {
        setupContentView()
        setupInnerCircle()
    }
    
    func setupExtraConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = K.COLORS.TYPE.PSYCHIC
        layer.cornerRadius = 10
    }
    
    private func setupContentView() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 20),
            heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupInnerCircle() {
        NSLayoutConstraint.activate([
            innerCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            innerCircle.widthAnchor.constraint(equalToConstant: 12),
            innerCircle.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
}
