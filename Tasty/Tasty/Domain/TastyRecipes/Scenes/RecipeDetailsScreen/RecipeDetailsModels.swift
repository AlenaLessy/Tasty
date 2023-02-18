//  RecipeDetailsModels.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

enum RecipeDetailsModel {
    
    enum InitForm {
        struct Request {}
        struct Response {
        }
        struct ViewModel {}
    }
    
    enum RecipeDetailsChanged {
        struct Request {}
        struct Response {
            /// Рецепт
            let recipe: Recipe
            /// Дата для получения картинки рецепта
            let imageData: Data
        }
        struct ViewModel {
            /// Рецепт
            let recipe: Recipe
            /// Дата для получения картинки рецепта
            let imageData: Data
        }
    }
    
    enum FavoriteChanged {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }

    enum ShowTinderApp {
        struct Request {}
        struct Response {
            /// Адрес приложения
            let address: String
        }
        struct ViewModel {
            /// URL приложения
            let url: URL
        }
    }
}
