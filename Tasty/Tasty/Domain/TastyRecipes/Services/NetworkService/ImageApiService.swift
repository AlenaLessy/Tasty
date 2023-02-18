//  ImageApiService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервис загрузки изображений
final class ImageApiService: ImageApiServiceProtocol {
  
    // MARK: - Public Methods

    func fetchData(from url: URL) async throws -> Data {
      let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
