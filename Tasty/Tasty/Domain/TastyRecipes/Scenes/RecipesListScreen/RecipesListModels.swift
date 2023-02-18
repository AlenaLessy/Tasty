//
//  RecipesListModels.swift
//  Tasty
//
//  Created by Алена Панченко on 15.02.2023.
//

import Foundation

/// Модель экрана списка рецептов
enum RecipesListModel {
    
    enum InitForm {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }
    
    enum RecipesListChanged {
        struct Request {}
        struct Response {
            /// Рецепты
            let recipes: [Recipe]
        }
        struct ViewModel {
            /// Рецепты
            let recipes: [Recipe]
        }
    }
    
    enum imagesDataChanged {
        struct Request {}
        struct Response {
            /// Картинки рецептов
            let recipesImages: [Data]
        }
        struct ViewModel {
            /// Картинки рецептов
            let recipesImages: [Data]
        }
    }
    
    enum IDRecipeDetailsChanged {
        struct Request {
            /// Индекс рецепта
            let index: Int
        }
        struct Response {
            /// Id рецепта для запроса
            let idUrlString: String
        }
        struct ViewModel {
            /// Id рецепта для запроса
            let urlString: String
        }
    }
    
}
