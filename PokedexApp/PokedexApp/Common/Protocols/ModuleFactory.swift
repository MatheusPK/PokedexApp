//
//  ModuleFactory.swift
//  PokedexApp
//
//  Created by Matheus P.K on 25/07/22.
//

import Foundation
import UIKit

protocol ModuleFactory {
    associatedtype Dependencies
    static func make(with dependencies: Dependencies) -> UIViewController
}
