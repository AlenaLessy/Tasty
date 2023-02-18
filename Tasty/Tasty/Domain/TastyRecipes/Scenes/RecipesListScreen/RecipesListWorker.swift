//  RecipesListNetworkWorker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Воркер экрана списка рецептов
final class RecipesListWorker: RecipesListWorkerProtocol {
    
    // MARK: - Private Properties
    
    private let networkService: NetworkServiceProtocol
    private let imageApiService: ImageApiServiceProtocol
    
    // MARK: - Initializers
    
    init(networkService: NetworkServiceProtocol, imageApiService: ImageApiServiceProtocol) {
        self.networkService = networkService
        self.imageApiService = imageApiService
    }
    
    // MARK: - Public Methods
    
    func fetchRecipes(from url: URL) async throws -> [Recipe] {
        try await networkService.fetchRecipes(from: url)
    }
    
    func fetchData(from url: URL) async throws -> Data {
        try await imageApiService.fetchData(from: url)
    }
}
