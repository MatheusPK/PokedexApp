//
//  FiltersPresenter.swift
//  PokedexApp
//
//  Created by Matheus P.K on 14/08/22.
//

import Foundation
import UIKit

protocol FiltersPresenterOutput: AnyObject {}

class FiltersPresenter {
    weak var viewController: FiltersPresenterOutput?
}

extension FiltersPresenter: FiltersInteractorOutput {}
