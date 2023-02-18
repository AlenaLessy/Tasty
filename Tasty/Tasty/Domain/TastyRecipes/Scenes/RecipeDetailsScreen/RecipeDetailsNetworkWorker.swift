//  RecipeDetailsNetworkWorker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

final class RecipeDetailsNetworkWorker: RecipeDetailsNetworkWorkerProtocol {
    
    // MARK: - Private Properties
    
    private let networkService: NetworkServiceProtocol
    private let imageApiService: ImageApiServiceProtocol
    
    // MARK: - Initializers
    
    init(networkService: NetworkServiceProtocol, imageApiService: ImageApiServiceProtocol) {
        self.networkService = networkService
        self.imageApiService = imageApiService
    }
    
    // MARK: - Public Methods
    
    func fetchRecipeDetails(from url: URL) async throws -> Recipe {
        try await networkService.fetchRecipeDetails(from: url)
    }
    
    func fetchData(from url: URL) async throws -> Data {
        try await imageApiService.fetchData(from: url)
    }
}
