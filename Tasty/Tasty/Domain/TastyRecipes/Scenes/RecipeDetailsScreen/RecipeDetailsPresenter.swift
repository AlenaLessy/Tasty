//  RecipeDetailsPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер экрана рецепта
final class RecipeDetailsPresenter: RecipeDetailsPresentationLogic {
  
    // MARK: - Public Properties
    
  weak var viewController: RecipeDetailsDisplayLogic?
  
    // MARK: - Public Methods
    
    func presentInitForm(response: RecipeDetailsModel.InitForm.Response) {
        let viewModel = RecipeDetailsModel.InitForm.ViewModel()
        viewController?.displayInitForm(viewModel)
    }
    
    func presentRecipeDetails(response:RecipeDetailsModel.RecipeDetailsChanged.Response) {
        let viewModel = RecipeDetailsModel.RecipeDetailsChanged.ViewModel(recipe: response.recipe, imageData: response.imageData)
        viewController?.displayRecipeDetails(viewModel: viewModel)
    }
   
    func presentFavorite(response: RecipeDetailsModel.FavoriteChanged.Response) {
        let viewModel = RecipeDetailsModel.FavoriteChanged.ViewModel()
        viewController?.displayFavorite(viewModel)
    }
 
    func presentShowTinderApp(response: RecipeDetailsModel.ShowTinderApp.Response) {
        guard let url = URL(string: response.address) else { return }
        let viewModel = RecipeDetailsModel.ShowTinderApp.ViewModel(url: url)
        viewController?.displayShowTinder(viewModel: viewModel)
    }
}
