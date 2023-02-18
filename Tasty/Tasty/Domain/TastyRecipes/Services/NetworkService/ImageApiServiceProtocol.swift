//
//  ImageApiServiceProtocol.swift
//  Tasty
//
//  Created by Алена Панченко on 17.02.2023.
//

import Foundation

/// Протокол сервиса загрузки изображений
protocol ImageApiServiceProtocol {
    func fetchData(from url: URL) async throws -> Data
}
