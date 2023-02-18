//
//  RecipesListProtocol.swift
//  Tasty
//
//  Created by Алена Панченко on 17.02.2023.
//

import Foundation

/// Протокол отображения экрана  списка рецептов
protocol RecipesListDisplayLogic: AnyObject {
    func displayRecipeList(viewModel: RecipesListModel.RecipesListChanged.ViewModel)
    func displayImageData(viewModel: RecipesListModel.imagesDataChanged.ViewModel)
    func displayInitForm(_ viewModel: RecipesListModel.InitForm.ViewModel)
    func displayRecipeDetails(viewModel: RecipesListModel.IDRecipeDetailsChanged.ViewModel)
}

/// Протокол бизнес логики экрана  списка рецептов
protocol RecipesListBusinessLogic {
    func requestRecipesList() async
    func requestData() async
    func requestId(index: Int)
    func requestInitForm()
}

/// Протокол воркера экрана списка рецептов
protocol RecipesListWorkerProtocol {
    func fetchRecipes(from url: URL) async throws -> [Recipe]
    func fetchData(from url: URL) async throws -> Data
}

/// Протокол презентера экрана списка рецептов
protocol RecipesListPresentationLogic {
    func presentRecipesList(response: RecipesListModel.RecipesListChanged.Response)
    func presentImagesData(response:RecipesListModel.imagesDataChanged.Response)
    func presentInitForm(_ request: RecipesListModel.InitForm.Response)
}

/// Протокол роутера экрана списка рецептов
protocol RecipesListRoutingLogic {
    func routeToRecipeDetails()
}

/// Протокол передачи данных с экрана списка рецептов
protocol RecipesListDataStore {
  var recipeId: String? { get }
}
