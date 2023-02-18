//  RecipeDetailsInteractor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерактор экрана рецепта
final class RecipeDetailsInteractor: RecipeDetailsBusinessLogic, RecipeDetailsDataStore {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let tinderURLText = "tinder://"
        static let emptyString = ""
        static let baseURLText = "https://api.edamam.com/api/recipes/v2/"
        static let queryItemsText = "?type=public&app_id=1e2c3d39&app_key=%2057a71cae5b22ae60b3dadc7423fad742"
    }
    
    // MARK: - Public Properties
    
    var recipeId: String = Constants.emptyString
    
    // MARK: - Private Properties
    
    private let presenter: RecipeDetailsPresentationLogic?
    private let worker: RecipeDetailsNetworkWorkerProtocol?
    
    private var recipe: Recipe?
    private var imageData: Data?
    private var tinderURL = Constants.tinderURLText
    
    // MARK: - Initializers
    
    init(presenter: RecipeDetailsPresentationLogic, worker: RecipeDetailsNetworkWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - Public Properties
    
    func requestRecipesList() async {
        let urlString = "\(Constants.baseURLText)\(recipeId)\(Constants.queryItemsText)"
        guard let url = URL(string: urlString),
              let worker
        else { return }
        do {
            recipe = try await worker.fetchRecipeDetails(from: url)
            if let imageUrlString = recipe?.image,
               let imageUrl = URL(string: imageUrlString) {
                imageData = try await worker.fetchData(from: imageUrl)
            }
        } catch {
            print(error.localizedDescription)
        }
        guard let recipe,
              let imageData
        else { return }
        let response = RecipeDetailsModel.RecipeDetailsChanged.Response(recipe: recipe, imageData: imageData)
        presenter?.presentRecipeDetails(response: response)
    }
    
    func requestInitForm() {
        let response = RecipeDetailsModel.InitForm.Response()
        presenter?.presentInitForm(response: response)
    }
    
    func requestFavorite() {
        let response = RecipeDetailsModel.FavoriteChanged.Response()
        presenter?.presentFavorite(response: response)
    }
    
    func requestShowTinder() {
        let response = RecipeDetailsModel.ShowTinderApp.Response(address: tinderURL)
        presenter?.presentShowTinderApp(response: response)
    }
}
