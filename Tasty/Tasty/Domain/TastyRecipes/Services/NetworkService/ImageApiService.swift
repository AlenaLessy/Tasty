//
//  ImageApiService.swift
//  Tasty
//
//  Created by Алена Панченко on 17.02.2023.
//

import Foundation

/// Сервис загрузки изображений
final class ImageApiService: ImageApiServiceProtocol {
  
    // MARK: - Public Methods

    func fetchData(from url: URL) async throws -> Data {
      let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
