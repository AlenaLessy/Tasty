//  RecipesListInteractor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерактор экрана списка рецептов
final class RecipesListInteractor: RecipesListBusinessLogic, RecipesListDataStore {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let urlString = "https://api.edamam.com/api/recipes/v2?type=public&q=keto&app_id=1e2c3d39&app_key=%2057a71cae5b22ae60b3dadc7423fad742"
        static let separatorGridSymbol = "#"
        static let secondPartURLLineNumber = 1
    }
    // MARK: - Public Properties
    
    var presenter: RecipesListPresentationLogic?
    var worker: RecipesListWorkerProtocol?
    var recipeId: String?
    var recipes: [Recipe] = []
   
    
    // MARK: - Private Properties
    
    private let urlString = Constants.urlString
    
    // MARK: - Initializers
    
    init(presenter: RecipesListPresentationLogic, worker: RecipesListWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - Public Properties
    
    func requestRecipesList() async {
        guard let url = URL(string: urlString),
              let worker
        else { return }
        do {
            recipes = try await worker.fetchRecipes(from: url)
        } catch {
            print(error)
        }
        let response = RecipesListModel.RecipesListChanged.Response(recipes: recipes)
        presenter?.presentRecipesList(response: response)
    }
    
    func requestId(index: Int) {
        let response = RecipesListModel.IDRecipeDetailsChanged.Response(idUrlString: recipes[index].uri)
        let uri = response.idUrlString.split(separator: Constants.separatorGridSymbol)
        let recipeId = String(uri[Constants.secondPartURLLineNumber])
        self.recipeId = recipeId
    }
    
    func requestData() async {
        var imagesData: [Data] = []
        guard recipes.count != 0 else { return }
        for index in recipes.indices {
            guard let imageUrl = URL(string: recipes[index].image),
                  let worker
            else { return }
            do {
                let imageData = try await worker.fetchData(from: imageUrl)
                imagesData.append(imageData)
            } catch {
                print(error.localizedDescription)
            }
            let response = RecipesListModel.imagesDataChanged.Response(recipesImages: imagesData)
            presenter?.presentImagesData(response: response)
        }
    }
    
    func requestInitForm() {
        let response = RecipesListModel.InitForm.Response()
        presenter?.presentInitForm(response)
    }
}
