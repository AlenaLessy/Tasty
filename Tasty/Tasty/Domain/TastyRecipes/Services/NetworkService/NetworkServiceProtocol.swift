//  NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сетевого сервиса
protocol NetworkServiceProtocol {
    func fetchRecipes(from url: URL) async throws -> [Recipe]
    func fetchRecipeDetails(from url: URL) async throws -> Recipe
}
