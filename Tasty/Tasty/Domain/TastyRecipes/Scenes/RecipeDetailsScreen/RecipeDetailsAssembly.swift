//  RecipeDetailsAssembly.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сборщик экрана рецепта
enum RecipeDetailsAssembly {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let emptyString = ""
    }
    static func build(dataStore: RecipesListDataStore) -> UIViewController {
        let presenter = RecipeDetailsPresenter()
        let networkService = NetworkService()
        let imageApiService = ImageApiService()
        let worker = RecipeDetailsNetworkWorker(networkService: networkService, imageApiService: imageApiService)
        let interactor = RecipeDetailsInteractor(presenter: presenter, worker: worker)
        interactor.recipeId = dataStore.recipeId ?? Constants.emptyString
        let router = RecipeDetailsRouter(dataStore: interactor)
        let viewController = RecipeDetailsViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
