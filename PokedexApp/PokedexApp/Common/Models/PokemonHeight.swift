//
//  PokemonHeight.swift
//  PokedexApp
//
//  Created by Matheus P.K on 21/08/22.
//

import Foundation
import UIKit

enum PokemonHeight: Codable, CaseIterable {
    static var allCases: [PokemonHeight] = [.short(size: 0), .medium(size: 0), .tall(size: 0)]
    
    case short(size: Int)
    case medium(size: Int)
    case tall(size: Int)
    
    func color() -> UIColor {
        switch self {
        case .short:  return K.COLORS.HEIGHT.SHORT
        case .medium: return K.COLORS.HEIGHT.MEDIUM
        case .tall:   return K.COLORS.HEIGHT.TALL
        }
    }
    
    func icon() -> UIImage? {
        switch self {
        case .short:  return UIImage(named: "Short")
        case .medium: return UIImage(named: "Medium")
        case .tall:   return UIImage(named: "Tall")
        }
    }
}
