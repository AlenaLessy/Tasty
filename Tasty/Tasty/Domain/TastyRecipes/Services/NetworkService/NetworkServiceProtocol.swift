//
//  NetworkServiceProtocol.swift
//  Tasty
//
//  Created by Алена Панченко on 17.02.2023.
//

import Foundation

/// Протокол сетевого сервиса
protocol NetworkServiceProtocol {
    func fetchRecipes(from url: URL) async throws -> [Recipe]
    func fetchRecipeDetails(from url: URL) async throws -> Recipe
}
