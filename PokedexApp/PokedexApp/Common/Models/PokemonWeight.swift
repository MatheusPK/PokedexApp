//
//  PokemonWeight.swift
//  PokedexApp
//
//  Created by Matheus P.K on 24/08/22.
//

import Foundation
import UIKit

enum PokemonWeight: Codable, CaseIterable {
    
    static var allCases: [PokemonWeight] = [.light(weight: 0), normal(weight: 0), heavy(weight: 0)]
    
    case light(weight: Int)
    case normal(weight: Int)
    case heavy(weight: Int)
    
    func color() -> UIColor {
        switch self {
        case .light:  return K.COLORS.WEIGHT.LIGHT
        case .normal: return K.COLORS.WEIGHT.NORMAL
        case .heavy:   return K.COLORS.WEIGHT.HEAVY
        }
    }
    
    func icon() -> UIImage? {
        switch self {
        case .light:  return UIImage(named: "Light")
        case .normal: return UIImage(named: "wNormal")
        case .heavy:   return UIImage(named: "Heavy")
        }
    }
    
}
