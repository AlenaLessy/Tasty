//  RecipesListPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер экрана списка рецептов
final class RecipesListPresenter: RecipesListPresentationLogic {
    
    // MARK: - Public Properties
    
    weak var viewController: RecipesListDisplayLogic?
    
    // MARK: - Public Methods
    
    func presentRecipesList(response:RecipesListModel.RecipesListChanged.Response) {
        let viewModel = RecipesListModel.RecipesListChanged.ViewModel(recipes: response.recipes)
        viewController?.displayRecipeList(viewModel: viewModel)
    }
    
    func presentImagesData(response:RecipesListModel.imagesDataChanged.Response) {
        let viewModel = RecipesListModel.imagesDataChanged.ViewModel(recipesImages: response.recipesImages)
        viewController?.displayImageData(viewModel: viewModel)
    }
        
    func presentInitForm(_ request: RecipesListModel.InitForm.Response) {
        let viewModel = RecipesListModel.InitForm.ViewModel()
        viewController?.displayInitForm(viewModel)
    }
}
