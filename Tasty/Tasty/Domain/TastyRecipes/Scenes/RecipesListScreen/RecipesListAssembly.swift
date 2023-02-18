//  RecipesListAssembly.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сборщик модуля списка рецептов
enum RecipesListAssembly {
    
    static func build() -> UIViewController {
        let presenter = RecipesListPresenter()
        let networkService = NetworkService()
        let imageApiService = ImageApiService()
        let worker = RecipesListWorker(networkService: networkService, imageApiService: imageApiService)
        let interactor = RecipesListInteractor(presenter: presenter, worker: worker)
        let router = RecipesListRouter(dataStore: interactor)
        let viewController = RecipesListViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.view = viewController
        return viewController
    }
}
