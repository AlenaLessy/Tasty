//  RecipesListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import StoreKit

/// Роутер экрана рецепта
final class RecipeDetailsRouter: RecipeDetailsRoutingLogic {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let appId = 547702041
    }
    
    // MARK: - Public Properties
    
    weak var viewController: RecipeDetailsViewController?
    
    var dataStore: RecipeDetailsDataStore?
    
    // MARK: - Initializers
    
    init(dataStore: RecipeDetailsDataStore?) {
        self.dataStore = dataStore
    }
    
    // MARK: Routing Logic
    
    func routeToTinder(url: URL) {
        let viewController = SKStoreProductViewController()
        viewController.loadProduct(withParameters:  [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: Constants.appId)], completionBlock: nil)
        self.viewController?.present(viewController, animated: true)
    }
}


