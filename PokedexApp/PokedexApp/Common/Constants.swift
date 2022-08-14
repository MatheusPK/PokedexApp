//
//  Constants.swift
//  PokedexApp
//
//  Created by Matheus P.K on 27/07/22.
//

import Foundation
import UIKit

struct K {
    
    struct IMAGES {
        struct PLACEHOLDER {
            static var POKEMON_FRONT = UIImage(named: "pokemonFrontImagePlaceholder")
        }
        
        struct PATTERNS {
            static var POKEBALL_HOME_BACKGROUND = UIImage(named: "Pokeball")?.tintedWithLinearGradientColors(colorsArr: [K.COLORS.BACKGROUND.POKEBALL_HOME_BACKGROUND_GRADIENT.withAlphaComponent(1).cgColor, UIColor.white.withAlphaComponent(1).cgColor])
            static var POKEBALL_CELL_BACKGROUND = UIImage(named: "Pokeball")?.tintedWithLinearGradientColors(colorsArr: [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.withAlphaComponent(0.3).cgColor])
            static var I6X3_LIST_BACKGROUND     = UIImage(named: "6x3")?.tintedWithLinearGradientColors(colorsArr: [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.withAlphaComponent(0.3).cgColor])
        }
        
        struct ICONS {
            static var GENERATION = UIImage(named: "Generation")
            static var SORT       = UIImage(named: "Sort")
            static var FILTER     = UIImage(named: "Filter")
        }
        
    }
    
    struct FONTS {
        static var TITLE             = UIFont.systemFont(ofSize: 100, weight: .bold)
        static var APPLICATION_TITLE = UIFont.systemFont(ofSize: 32, weight: .bold)
        static var POKEMON_NAME      = UIFont.systemFont(ofSize: 26, weight: .bold)
        static var FILTER_TITLE      = UIFont.systemFont(ofSize: 16, weight: .bold)
        static var DESCRIPTION       = UIFont.systemFont(ofSize: 16, weight: .regular)
        static var POKEMON_NUMBER    = UIFont.systemFont(ofSize: 12, weight: .bold)
        static var POKEMON_TYPE      = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    struct COLORS {
        struct TYPE {
            static var BUG      = #colorLiteral(red: 0.5490196078, green: 0.6980392157, blue: 0.1882352941, alpha: 1)
            static var DARK     = #colorLiteral(red: 0.3450980392, green: 0.3411764706, blue: 0.3725490196, alpha: 1)
            static var DRAGON   = #colorLiteral(red: 0.05882352941, green: 0.4156862745, blue: 0.7529411765, alpha: 1)
            static var ELECTRIC = #colorLiteral(red: 0.9333333333, green: 0.8352941176, blue: 0.2078431373, alpha: 1)
            static var FAIRY    = #colorLiteral(red: 0.9294117647, green: 0.431372549, blue: 0.7803921569, alpha: 1)
            static var FIGHTING = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.3921568627, alpha: 1)
            static var FIRE     = #colorLiteral(red: 0.9921568627, green: 0.4901960784, blue: 0.1411764706, alpha: 1)
            static var FLYING   = #colorLiteral(red: 0.4549019608, green: 0.5607843137, blue: 0.7882352941, alpha: 1)
            static var GHOST    = #colorLiteral(red: 0.3333333333, green: 0.4156862745, blue: 0.6823529412, alpha: 1)
            static var GRASS    = #colorLiteral(red: 0.3843137255, green: 0.7254901961, blue: 0.3411764706, alpha: 1)
            static var GROUND   = #colorLiteral(red: 0.8666666667, green: 0.4666666667, blue: 0.2823529412, alpha: 1)
            static var ICE      = #colorLiteral(red: 0.3803921569, green: 0.8078431373, blue: 0.7529411765, alpha: 1)
            static var NORMAL   = #colorLiteral(red: 0.6156862745, green: 0.6274509804, blue: 0.6666666667, alpha: 1)
            static var POISON   = #colorLiteral(red: 0.6470588235, green: 0.3215686275, blue: 0.8, alpha: 1)
            static var PSYCHIC  = #colorLiteral(red: 0.9176470588, green: 0.3647058824, blue: 0.3764705882, alpha: 1)
            static var ROCK     = #colorLiteral(red: 0.7294117647, green: 0.6705882353, blue: 0.5098039216, alpha: 1)
            static var STEEL    = #colorLiteral(red: 0.2549019608, green: 0.4901960784, blue: 0.6039215686, alpha: 1)
            static var WATER    = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8549019608, alpha: 1)
        }
        
        struct BACKGROUND_TYPE {
            static var BUG      = #colorLiteral(red: 0.5450980392, green: 0.8392156863, blue: 0.4549019608, alpha: 1)
            static var DARK     = #colorLiteral(red: 0.4352941176, green: 0.431372549, blue: 0.4705882353, alpha: 1)
            static var DRAGON   = #colorLiteral(red: 0.4509803922, green: 0.5137254902, blue: 0.7254901961, alpha: 1)
            static var ELECTRIC = #colorLiteral(red: 0.9490196078, green: 0.7960784314, blue: 0.3333333333, alpha: 1)
            static var FAIRY    = #colorLiteral(red: 0.9215686275, green: 0.6588235294, blue: 0.7647058824, alpha: 1)
            static var FIGHTING = #colorLiteral(red: 0.9215686275, green: 0.2862745098, blue: 0.4431372549, alpha: 1)
            static var FIRE     = #colorLiteral(red: 1, green: 0.6549019608, blue: 0.337254902, alpha: 1)
            static var FLYING   = #colorLiteral(red: 0.5137254902, green: 0.6352941176, blue: 0.8901960784, alpha: 1)
            static var GHOST    = #colorLiteral(red: 0.5215686275, green: 0.4431372549, blue: 0.7450980392, alpha: 1)
            static var GRASS    = #colorLiteral(red: 0.5450980392, green: 0.7450980392, blue: 0.5411764706, alpha: 1)
            static var GROUND   = #colorLiteral(red: 0.968627451, green: 0.5215686275, blue: 0.3176470588, alpha: 1)
            static var ICE      = #colorLiteral(red: 0.568627451, green: 0.8470588235, blue: 0.8745098039, alpha: 1)
            static var NORMAL   = #colorLiteral(red: 0.7098039216, green: 0.7254901961, blue: 0.768627451, alpha: 1)
            static var POISON   = #colorLiteral(red: 0.6235294118, green: 0.431372549, blue: 0.5921568627, alpha: 1)
            static var PSYCHIC  = #colorLiteral(red: 1, green: 0.3960784314, blue: 0.4078431373, alpha: 1)
            static var ROCK     = #colorLiteral(red: 0.831372549, green: 0.7607843137, blue: 0.5803921569, alpha: 1)
            static var STEEL    = #colorLiteral(red: 0.2980392157, green: 0.568627451, blue: 0.6980392157, alpha: 1)
            static var WATER    = #colorLiteral(red: 0.3450980392, green: 0.6705882353, blue: 0.9647058824, alpha: 1)
        }
        
        struct BACKGROUND {
            static var WHITE                             = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static var DEFAULT_INPUT                     = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            static var PRESSED_INPUT                     = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
            static var MODAL                             = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.1058823529, alpha: 0.5)
            static var POKEBALL_HOME_BACKGROUND_GRADIENT = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        }
        
        struct TEXT {
            static var WHITE  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static var BLACK  = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.1058823529, alpha: 1)
            static var GREY   = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.462745098, alpha: 1)
            static var NUMBER = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.1058823529, alpha: 0.6)
        }
        
        struct HEIGHT {
            static var SHORT  = #colorLiteral(red: 1, green: 0.7725490196, blue: 0.9019607843, alpha: 1)
            static var MEDIUM = #colorLiteral(red: 0.6823529412, green: 0.7490196078, blue: 0.8431372549, alpha: 1)
            static var TALL   = #colorLiteral(red: 0.6666666667, green: 0.6745098039, blue: 0.7215686275, alpha: 1)
        }
        
        struct WEIGHT {
            static var LIGHT  = #colorLiteral(red: 0.6, green: 0.8039215686, blue: 0.4862745098, alpha: 1)
            static var NORMAL = #colorLiteral(red: 0.3411764706, green: 0.6980392157, blue: 0.862745098, alpha: 1)
            static var HEAVY  = #colorLiteral(red: 0.3529411765, green: 0.5725490196, blue: 0.6470588235, alpha: 1)
        }
    }
}
