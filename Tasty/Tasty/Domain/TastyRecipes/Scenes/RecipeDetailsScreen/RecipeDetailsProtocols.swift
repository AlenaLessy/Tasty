//
//  RecipeDetailsProtocols.swift
//  Tasty
//
//  Created by Алена Панченко on 18.02.2023.
//

import Foundation

/// Протокол отображения экрана рецепта
protocol RecipeDetailsDisplayLogic: AnyObject {
    func displayRecipeDetails(viewModel: RecipeDetailsModel.RecipeDetailsChanged.ViewModel)
    func displayInitForm(_ viewModel: RecipeDetailsModel.InitForm.ViewModel)
    func displayFavorite(_ viewModel: RecipeDetailsModel.FavoriteChanged.ViewModel)
    func displayShowTinder(viewModel: RecipeDetailsModel.ShowTinderApp.ViewModel)
}

/// Протокол бизнес логики экрана  рецепта
protocol RecipeDetailsBusinessLogic {
    func requestRecipesList() async
    func requestInitForm()
    func requestShowTinder()
    func requestFavorite()
}

/// Протокол передачи данных  экрана  рецепта
protocol RecipeDetailsDataStore {
    var recipeId: String { get set}
}

/// Протокол презентера  экрана  рецепта
protocol RecipeDetailsPresentationLogic {
    func presentRecipeDetails(response: RecipeDetailsModel.RecipeDetailsChanged.Response)
    func presentInitForm(response: RecipeDetailsModel.InitForm.Response)
    func presentShowTinderApp(response: RecipeDetailsModel.ShowTinderApp.Response)
    func presentFavorite(response: RecipeDetailsModel.FavoriteChanged.Response)
}

/// Протокол воркера экрана рецепта
protocol RecipeDetailsNetworkWorkerProtocol {
    func fetchRecipeDetails(from url: URL) async throws -> Recipe
    func fetchData(from url: URL) async throws -> Data
}

/// Протокол роутера  экрана рецепта
protocol RecipeDetailsRoutingLogic {
func routeToTinder(url: URL)
}
