//
//  NetworkModels.swift
//  Tasty
//
//  Created by Алена Панченко on 16.02.2023.
//

import Foundation

/// Верхний уровень запросов рецептов
struct RecipeResponse: Codable {
    let hits: [RecipeLinks]
}

/// Ссылка на рецепт
struct RecipeLinks: Codable {
    let recipe: Recipe
}

/// Рецепт
struct Recipe: Codable {
    /// Ссылка на рецепт
    let uri: String
    /// Название рецепта
    let label: String
    /// Имя изображения
    let image: String
    /// ID блюда
    let yield: Int
    /// Калории блюда
    let calories: Double
    /// Ингредиенты
    let ingredients: [Ingredient]
}

/// Ингредиенты

struct Ingredient: Codable {
    /// Ингредиент
    let text: String
}
