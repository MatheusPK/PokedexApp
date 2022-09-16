//
//  PokeButton.swift
//  PokedexApp
//
//  Created by Matheus P.K on 02/09/22.
//

import Foundation
import UIKit

class PokeButton: UIButton {
    
    init(title: String, size: UIButton.Configuration.Size) {
        var newConfiguration = UIButton.Configuration.filled()
        newConfiguration.buttonSize = .large
        newConfiguration.title = title
        newConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
          // 1
          var outgoing = incoming
          // 2
            outgoing.font = K.FONTS.DESCRIPTION
          // 3
          return outgoing
        }
        super.init(frame: .zero)
        configuration = newConfiguration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConfiguration() {
        guard let configuration = configuration else { return }
        
        var updatedConfiguration = configuration
        
        switch self.state {
        case .selected, .highlighted, .focused:
            updatedConfiguration.baseBackgroundColor = K.COLORS.TYPE.PSYCHIC
            updatedConfiguration.baseForegroundColor = K.COLORS.TEXT.WHITE
        case .normal:
            updatedConfiguration.baseBackgroundColor = K.COLORS.BACKGROUND.DEFAULT_INPUT
            updatedConfiguration.baseForegroundColor = K.COLORS.TEXT.GREY
        default:
            break
        }
        
        self.configuration = updatedConfiguration
        
    }
    
}
