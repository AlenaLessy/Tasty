//
//  NetworkService.swift
//  Tasty
//
//  Created by Алена Панченко on 17.02.2023.
//

import Foundation

/// Сетевые запросы
final class NetworkService: NetworkServiceProtocol {

    // MARK: - Public Methods

    func fetchRecipes(from url: URL) async throws -> [Recipe] {
      let (data, _) = try await URLSession.shared.data(from: url)
     let result = try JSONDecoder().decode(RecipeResponse.self, from: data)
        var recipes: [Recipe] = []
        recipes += result.hits.compactMap{ $0.recipe }
        return recipes
    }
    
      func fetchRecipeDetails(from url: URL) async throws -> Recipe {
        let (data, _) = try await URLSession.shared.data(from: url)
          let result = try JSONDecoder().decode(RecipeLinks.self, from: data)
          return result.recipe
      }
}


