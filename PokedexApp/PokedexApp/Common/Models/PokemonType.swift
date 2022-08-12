//
//  PokemonType.swift
//  PokedexApp
//
//  Created by Matheus P.K on 03/08/22.
//

import Foundation
import UIKit

enum PokemonType: Codable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let type = try? container.decode(String.self)
        switch type {
        case "bug":      self = .bug
        case "dark":     self = .dark
        case "dragon":   self = .dragon
        case "electric":  self = .electric
        case "fairy":    self = .fairy
        case "fighting": self = .fighting
        case "fire":     self = .fire
        case "flying":   self = .flying
        case "ghost":    self = .ghost
        case "grass":    self = .grass
        case "ground":   self = .ground
        case "ice":      self = .ice
        case "normal":   self = .normal
        case "poison":   self = .poison
        case "psychic":  self = .psychic
        case "rock":     self = .rock
        case "steel":    self = .steel
        case "water":    self = .water
        default:         self = .unknown
        }
    }
    
    func text() -> String {
        switch self {
        case .bug:       return "Bug"
        case .dark:      return "Dark"
        case .dragon:    return "Dragon"
        case .electric:  return "Electric"
        case .fairy:     return "Fairy"
        case .fighting:  return "Fighting"
        case .fire:      return "Fire"
        case .flying:    return "Flying"
        case .ghost:     return "Ghost"
        case .grass:     return "Grass"
        case .ground:    return "Ground"
        case .ice:       return "Ice"
        case .normal:    return "Normal"
        case .poison:    return "Poison"
        case .psychic:   return "Psychic"
        case .rock:      return "Rock"
        case .steel:     return "Steel"
        case .water:     return "Water"
        case .unknown:   return ""
        }
    }
    
    func icon() -> UIImage? {
        switch self {
        case .bug:      return UIImage(named: "Bug")
        case .dark:     return UIImage(named: "Dark")
        case .dragon:   return UIImage(named: "Dragon")
        case .electric:  return UIImage(named: "Electric")
        case .fairy:    return UIImage(named: "Fairy")
        case .fighting: return UIImage(named: "Fighting")
        case .fire:     return UIImage(named: "Fire")
        case .flying:   return UIImage(named: "Flying")
        case .ghost:    return UIImage(named: "Ghost")
        case .grass:    return UIImage(named: "Grass")
        case .ground:   return UIImage(named: "Ground")
        case .ice:      return UIImage(named: "Ice")
        case .normal:   return UIImage(named: "Normal")
        case .poison:   return UIImage(named: "Poison")
        case .psychic:  return UIImage(named: "Psychic")
        case .rock:     return UIImage(named: "Rock")
        case .steel:    return UIImage(named: "Steel")
        case .water:    return UIImage(named: "Water")
        case .unknown:  return UIImage()
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .bug:
            return K.COLORS.TYPE.BUG
        case .dark:
            return K.COLORS.TYPE.DARK
        case .dragon:
            return K.COLORS.TYPE.DRAGON
        case .electric:
            return K.COLORS.TYPE.ELECTRIC
        case .fairy:
            return K.COLORS.TYPE.FAIRY
        case .fighting:
            return K.COLORS.TYPE.FIGHTING
        case .fire:
            return K.COLORS.TYPE.FIRE
        case .flying:
            return K.COLORS.TYPE.FLYING
        case .ghost:
            return K.COLORS.TYPE.GHOST
        case .grass:
            return K.COLORS.TYPE.GRASS
        case .ground:
            return K.COLORS.TYPE.GROUND
        case .ice:
            return K.COLORS.TYPE.ICE
        case .normal:
            return K.COLORS.TYPE.NORMAL
        case .poison:
            return K.COLORS.TYPE.POISON
        case .psychic:
            return K.COLORS.TYPE.PSYCHIC
        case .rock:
            return K.COLORS.TYPE.ROCK
        case .steel:
            return K.COLORS.TYPE.STEEL
        case .water:
            return K.COLORS.TYPE.WATER
        case .unknown:
            return UIColor.clear
        }
    }
    
    func backgroundColor() -> UIColor {
        switch self {
        case .bug:
            return K.COLORS.BACKGROUND_TYPE.BUG
        case .dark:
            return K.COLORS.BACKGROUND_TYPE.DARK
        case .dragon:
            return K.COLORS.BACKGROUND_TYPE.DRAGON
        case .electric:
            return K.COLORS.BACKGROUND_TYPE.ELECTRIC
        case .fairy:
            return K.COLORS.BACKGROUND_TYPE.FAIRY
        case .fighting:
            return K.COLORS.BACKGROUND_TYPE.FIGHTING
        case .fire:
            return K.COLORS.BACKGROUND_TYPE.FIRE
        case .flying:
            return K.COLORS.BACKGROUND_TYPE.FLYING
        case .ghost:
            return K.COLORS.BACKGROUND_TYPE.GHOST
        case .grass:
            return K.COLORS.BACKGROUND_TYPE.GRASS
        case .ground:
            return K.COLORS.BACKGROUND_TYPE.GROUND
        case .ice:
            return K.COLORS.BACKGROUND_TYPE.ICE
        case .normal:
            return K.COLORS.BACKGROUND_TYPE.NORMAL
        case .poison:
            return K.COLORS.BACKGROUND_TYPE.POISON
        case .psychic:
            return K.COLORS.BACKGROUND_TYPE.PSYCHIC
        case .rock:
            return K.COLORS.BACKGROUND_TYPE.ROCK
        case .steel:
            return K.COLORS.BACKGROUND_TYPE.STEEL
        case .water:
            return K.COLORS.BACKGROUND_TYPE.WATER
        case .unknown:
            return UIColor.clear
        }
    }
    
    
}
