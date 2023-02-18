//
//  RecipeDetailsAssembly.swift
//  Tasty
//
//  Created by Алена Панченко on 16.02.2023.
//

import UIKit

/// Сборщик экрана рецепта
enum RecipeDetailsAssembly {
    static func build(dataStore: RecipesListDataStore) -> UIViewController {
        let presenter = RecipeDetailsPresenter()
        let networkService = NetworkService()
        let imageApiService = ImageApiService()
        let worker = RecipeDetailsNetworkWorker(networkService: networkService, imageApiService: imageApiService)
        let interactor = RecipeDetailsInteractor(presenter: presenter, worker: worker)
        interactor.recipeId = dataStore.recipeId ?? ""
        let router = RecipeDetailsRouter(dataStore: interactor)
        let viewController = RecipeDetailsViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
