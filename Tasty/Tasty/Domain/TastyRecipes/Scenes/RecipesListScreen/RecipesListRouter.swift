//  RecipesListRouter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Роутер экрана списка фильмов
final class RecipesListRouter: RecipesListRoutingLogic {
    
    // MARK: - Public Properties
    
    weak var view: RecipesListViewController?
    var dataStore: RecipesListDataStore
    
    // MARK: - Initializers
    
    init(dataStore: RecipesListDataStore) {
        self.dataStore = dataStore
    }
    
    // MARK: Routing Logic
    func routeToRecipeDetails() {
        let recipeDetailsViewController = RecipeDetailsAssembly.build(dataStore: dataStore)
        view?.navigationController?.pushViewController(recipeDetailsViewController, animated: true)
    }
}
